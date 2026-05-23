#pragma once

#include "esphome/core/component.h"
#include "esphome/components/switch/switch.h"
#include "esphome/components/sensor/sensor.h"
#include "esphome/components/socket/socket.h"

#include <string>
#include <memory>
#include <vector>

namespace esphome {
namespace switcher_proxy {

class SwitcherDevice;

class SwitcherHub : public Component {
 public:
  void setup() override;
  void loop() override;
  void dump_config() override;
  float get_setup_priority() const override { return setup_priority::AFTER_WIFI; }

  void register_device(SwitcherDevice *device) { this->devices_.push_back(device); }

 protected:
  void process_broadcast(const uint8_t *data, size_t len);

  std::unique_ptr<socket::Socket> udp_socket_{nullptr};
  std::vector<SwitcherDevice *> devices_;
};

class SwitcherDevice : public switch_::Switch, public Component {
 public:
  void setup() override {}
  void loop() override {}
  void dump_config() override;
  float get_setup_priority() const override { return setup_priority::AFTER_WIFI; }

  void set_hub(SwitcherHub *hub) { this->hub_ = hub; }
  void set_device_id(const std::string &id) { this->device_id_ = id; }
  void set_power_sensor(sensor::Sensor *sensor) { this->power_sensor_ = sensor; }
  void set_remaining_time_sensor(sensor::Sensor *sensor) { this->remaining_time_sensor_ = sensor; }

  const std::string &get_device_id() const { return this->device_id_; }
  bool is_device_id_match(const std::string &id) const;

  void handle_broadcast(const uint8_t *data, size_t len);

 protected:
  void write_state(bool state) override;
  bool send_command(bool turn_on, uint16_t timer_minutes = 0);

  SwitcherHub *hub_{nullptr};
  std::string device_id_;
  std::string device_ip_;
  uint8_t device_key_{0};
  uint32_t device_ip_numeric_{0};

  sensor::Sensor *power_sensor_{nullptr};
  sensor::Sensor *remaining_time_sensor_{nullptr};

  bool device_discovered_{false};
  bool pending_state_override_{false};
  bool pending_state_{false};
};

}  // namespace switcher_proxy
}  // namespace esphome
