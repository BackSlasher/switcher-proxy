#include "switcher_proxy.h"
#include "esphome/core/log.h"
#include "esphome/core/application.h"

#include <cstring>
#include <cstdio>

namespace esphome {
namespace switcher_proxy {

static const char *const TAG = "switcher_proxy";
static const uint16_t UDP_LISTEN_PORT = 20002;
static const uint16_t TCP_CONTROL_PORT = 9957;
static const size_t MAX_PACKET_SIZE = 256;

// CRC-CCITT lookup table (polynomial 0x1021)
static const uint16_t crc_table[256] = {
    0x0000, 0x1021, 0x2042, 0x3063, 0x4084, 0x50a5, 0x60c6, 0x70e7,
    0x8108, 0x9129, 0xa14a, 0xb16b, 0xc18c, 0xd1ad, 0xe1ce, 0xf1ef,
    0x1231, 0x0210, 0x3273, 0x2252, 0x52b5, 0x4294, 0x72f7, 0x62d6,
    0x9339, 0x8318, 0xb37b, 0xa35a, 0xd3bd, 0xc39c, 0xf3ff, 0xe3de,
    0x2462, 0x3443, 0x0420, 0x1401, 0x64e6, 0x74c7, 0x44a4, 0x5485,
    0xa56a, 0xb54b, 0x8528, 0x9509, 0xe5ee, 0xf5cf, 0xc5ac, 0xd58d,
    0x3653, 0x2672, 0x1611, 0x0630, 0x76d7, 0x66f6, 0x5695, 0x46b4,
    0xb75b, 0xa77a, 0x9719, 0x8738, 0xf7df, 0xe7fe, 0xd79d, 0xc7bc,
    0x48c4, 0x58e5, 0x6886, 0x78a7, 0x0840, 0x1861, 0x2802, 0x3823,
    0xc9cc, 0xd9ed, 0xe98e, 0xf9af, 0x8948, 0x9969, 0xa90a, 0xb92b,
    0x5af5, 0x4ad4, 0x7ab7, 0x6a96, 0x1a71, 0x0a50, 0x3a33, 0x2a12,
    0xdbfd, 0xcbdc, 0xfbbf, 0xeb9e, 0x9b79, 0x8b58, 0xbb3b, 0xab1a,
    0x6ca6, 0x7c87, 0x4ce4, 0x5cc5, 0x2c22, 0x3c03, 0x0c60, 0x1c41,
    0xedae, 0xfd8f, 0xcdec, 0xddcd, 0xad2a, 0xbd0b, 0x8d68, 0x9d49,
    0x7e97, 0x6eb6, 0x5ed5, 0x4ef4, 0x3e13, 0x2e32, 0x1e51, 0x0e70,
    0xff9f, 0xefbe, 0xdfdd, 0xcffc, 0xbf1b, 0xaf3a, 0x9f59, 0x8f78,
    0x9188, 0x81a9, 0xb1ca, 0xa1eb, 0xd10c, 0xc12d, 0xf14e, 0xe16f,
    0x1080, 0x00a1, 0x30c2, 0x20e3, 0x5004, 0x4025, 0x7046, 0x6067,
    0x83b9, 0x9398, 0xa3fb, 0xb3da, 0xc33d, 0xd31c, 0xe37f, 0xf35e,
    0x02b1, 0x1290, 0x22f3, 0x32d2, 0x4235, 0x5214, 0x6277, 0x7256,
    0xb5ea, 0xa5cb, 0x95a8, 0x8589, 0xf56e, 0xe54f, 0xd52c, 0xc50d,
    0x34e2, 0x24c3, 0x14a0, 0x0481, 0x7466, 0x6447, 0x5424, 0x4405,
    0xa7db, 0xb7fa, 0x8799, 0x97b8, 0xe75f, 0xf77e, 0xc71d, 0xd73c,
    0x26d3, 0x36f2, 0x0691, 0x16b0, 0x6657, 0x7676, 0x4615, 0x5634,
    0xd94c, 0xc96d, 0xf90e, 0xe92f, 0x99c8, 0x89e9, 0xb98a, 0xa9ab,
    0x5844, 0x4865, 0x7806, 0x6827, 0x18c0, 0x08e1, 0x3882, 0x28a3,
    0xcb7d, 0xdb5c, 0xeb3f, 0xfb1e, 0x8bf9, 0x9bd8, 0xabbb, 0xbb9a,
    0x4a75, 0x5a54, 0x6a37, 0x7a16, 0x0af1, 0x1ad0, 0x2ab3, 0x3a92,
    0xfd2e, 0xed0f, 0xdd6c, 0xcd4d, 0xbdaa, 0xad8b, 0x9de8, 0x8dc9,
    0x7c26, 0x6c07, 0x5c64, 0x4c45, 0x3ca2, 0x2c83, 0x1ce0, 0x0cc1,
    0xef1f, 0xff3e, 0xcf5d, 0xdf7c, 0xaf9b, 0xbfba, 0x8fd9, 0x9ff8,
    0x6e17, 0x7e36, 0x4e55, 0x5e74, 0x2e93, 0x3eb2, 0x0ed1, 0x1ef0,
};

static uint16_t crc16_ccitt(const uint8_t *data, size_t len, uint16_t init = 0x1021) {
  uint16_t crc = init;
  for (size_t i = 0; i < len; i++) {
    crc = (crc << 8) ^ crc_table[((crc >> 8) ^ data[i]) & 0xFF];
  }
  return crc;
}

static int hex_char_to_int(char c) {
  if (c >= '0' && c <= '9') return c - '0';
  if (c >= 'a' && c <= 'f') return c - 'a' + 10;
  if (c >= 'A' && c <= 'F') return c - 'A' + 10;
  return -1;
}

static char int_to_hex_char(int v) {
  if (v < 10) return '0' + v;
  return 'a' + (v - 10);
}

static std::vector<uint8_t> unhexlify(const std::string &hex) {
  std::vector<uint8_t> result;
  result.reserve(hex.length() / 2);
  for (size_t i = 0; i + 1 < hex.length(); i += 2) {
    int high = hex_char_to_int(hex[i]);
    int low = hex_char_to_int(hex[i + 1]);
    if (high < 0 || low < 0) break;
    result.push_back(static_cast<uint8_t>((high << 4) | low));
  }
  return result;
}

static std::string hexlify(const uint8_t *data, size_t len) {
  std::string result;
  result.reserve(len * 2);
  for (size_t i = 0; i < len; i++) {
    result += int_to_hex_char((data[i] >> 4) & 0x0F);
    result += int_to_hex_char(data[i] & 0x0F);
  }
  return result;
}

static std::string sign_packet_with_crc(const std::string &hex_packet) {
  std::vector<uint8_t> binary = unhexlify(hex_packet);
  uint16_t packet_crc = crc16_ccitt(binary.data(), binary.size(), 0x1021);

  char hex_crc[5];
  snprintf(hex_crc, sizeof(hex_crc), "%02x%02x", packet_crc & 0xFF, (packet_crc >> 8) & 0xFF);

  std::vector<uint8_t> key(34);
  key[0] = packet_crc & 0xFF;
  key[1] = (packet_crc >> 8) & 0xFF;
  std::memset(&key[2], 0x30, 32);

  uint16_t key_crc = crc16_ccitt(key.data(), key.size(), 0x1021);

  char hex_key_crc[5];
  snprintf(hex_key_crc, sizeof(hex_key_crc), "%02x%02x", key_crc & 0xFF, (key_crc >> 8) & 0xFF);

  return hex_packet + hex_crc + hex_key_crc;
}

static std::string set_message_length(const std::string &hex_packet) {
  size_t length = (hex_packet.length() / 2) + 4;
  char len_hex[5];
  snprintf(len_hex, sizeof(len_hex), "%02x%02x",
           static_cast<unsigned>(length & 0xFF),
           static_cast<unsigned>((length >> 8) & 0xFF));
  return "fef0" + std::string(len_hex) + hex_packet.substr(8);
}

static std::string timestamp_to_hex(uint32_t ts) {
  char buf[9];
  snprintf(buf, sizeof(buf), "%02x%02x%02x%02x",
           ts & 0xFF, (ts >> 8) & 0xFF, (ts >> 16) & 0xFF, (ts >> 24) & 0xFF);
  return buf;
}

static std::string minutes_to_hex_seconds(uint16_t minutes) {
  uint32_t seconds = static_cast<uint32_t>(minutes) * 60;
  char buf[9];
  snprintf(buf, sizeof(buf), "%02x%02x%02x%02x",
           seconds & 0xFF, (seconds >> 8) & 0xFF, (seconds >> 16) & 0xFF, (seconds >> 24) & 0xFF);
  return buf;
}

static const char *PAD_72_ZEROS = "000000000000000000000000000000000000000000000000000000000000000000000000";

static std::string build_login_packet(uint8_t device_key, uint32_t timestamp) {
  std::string ts_hex = timestamp_to_hex(timestamp);
  char key_hex[3];
  snprintf(key_hex, sizeof(key_hex), "%02x", device_key);

  std::string packet = "fef052000232a100";
  packet += "00000000";  // P_SESSION
  packet += "340001000000000000000000";
  packet += ts_hex;
  packet += "00000000000000000000f0fe";
  packet += key_hex;
  packet += PAD_72_ZEROS;
  packet += "00";

  return packet;
}

static std::string build_control_packet(const std::string &session_id, const std::string &device_id,
                                         bool turn_on, uint16_t timer_minutes, uint32_t timestamp) {
  std::string ts_hex = timestamp_to_hex(timestamp);
  std::string timer_hex = timer_minutes > 0 ? minutes_to_hex_seconds(timer_minutes) : "00000000";

  std::string packet = "fef05d0002320102";
  packet += session_id;
  packet += "340001000000000000000000";
  packet += ts_hex;
  packet += "00000000000000000000f0fe";
  packet += device_id;
  packet += PAD_72_ZEROS;
  packet += "000106000";
  packet += (turn_on ? "1" : "0");
  packet += "00";
  packet += timer_hex;

  return packet;
}

static std::vector<uint8_t> prepare_packet(const std::string &hex_packet) {
  std::string with_length = set_message_length(hex_packet);
  std::string signed_packet = sign_packet_with_crc(with_length);
  return unhexlify(signed_packet);
}

// ============================================================================
// SwitcherHub
// ============================================================================

void SwitcherHub::setup() {
  ESP_LOGCONFIG(TAG, "Setting up Switcher Hub...");

  this->udp_socket_ = socket::socket(AF_INET, SOCK_DGRAM, IPPROTO_IP);
  if (this->udp_socket_ == nullptr) {
    ESP_LOGE(TAG, "Could not create UDP socket");
    this->mark_failed();
    return;
  }

  int enable = 1;
  this->udp_socket_->setsockopt(SOL_SOCKET, SO_REUSEADDR, &enable, sizeof(enable));

  auto err = this->udp_socket_->setblocking(false);
  if (err < 0) {
    ESP_LOGE(TAG, "Unable to set nonblocking: errno %d", errno);
    this->mark_failed();
    return;
  }

  struct sockaddr_in server {};
  server.sin_family = AF_INET;
  server.sin_addr.s_addr = INADDR_ANY;
  server.sin_port = htons(UDP_LISTEN_PORT);

  err = this->udp_socket_->bind((struct sockaddr *) &server, sizeof(server));
  if (err != 0) {
    ESP_LOGE(TAG, "Socket unable to bind: errno %d", errno);
    this->mark_failed();
    return;
  }

  ESP_LOGI(TAG, "Listening for Switcher broadcasts on port %d (%d devices registered)",
           UDP_LISTEN_PORT, this->devices_.size());
}

void SwitcherHub::loop() {
  if (this->udp_socket_ == nullptr)
    return;

  uint8_t buf[MAX_PACKET_SIZE];
  for (;;) {
    auto len = this->udp_socket_->read(buf, sizeof(buf));
    if (len <= 0)
      break;

    ESP_LOGV(TAG, "Received UDP packet of length %d", len);
    this->process_broadcast(buf, static_cast<size_t>(len));
  }
}

void SwitcherHub::process_broadcast(const uint8_t *data, size_t len) {
  if (len < 165) return;
  if (data[0] != 0xFE || data[1] != 0xF0) return;
  if (len != 165) return;  // Only Type 1 water heaters for now

  // Extract device ID
  std::string broadcast_device_id = hexlify(&data[18], 3);

  // Dispatch to matching device(s)
  for (auto *device : this->devices_) {
    if (device->is_device_id_match(broadcast_device_id)) {
      device->handle_broadcast(data, len);
    }
  }
}

void SwitcherHub::dump_config() {
  ESP_LOGCONFIG(TAG, "Switcher Hub:");
  ESP_LOGCONFIG(TAG, "  Registered devices: %d", this->devices_.size());
}

// ============================================================================
// SwitcherDevice
// ============================================================================

bool SwitcherDevice::is_device_id_match(const std::string &id) const {
  // If no device_id configured, match any (auto-discover first device)
  if (this->device_id_.empty()) {
    return !this->device_discovered_;  // Only match if not yet discovered
  }
  return this->device_id_ == id;
}

void SwitcherDevice::handle_broadcast(const uint8_t *data, size_t len) {
  // Extract device ID from broadcast
  std::string broadcast_device_id = hexlify(&data[18], 3);

  // First time discovery
  if (!this->device_discovered_) {
    this->device_id_ = broadcast_device_id;
    this->device_key_ = data[40];
    this->device_ip_numeric_ = data[76] | (data[77] << 8) | (data[78] << 16) | (data[79] << 24);

    char ip_str[16];
    snprintf(ip_str, sizeof(ip_str), "%d.%d.%d.%d", data[76], data[77], data[78], data[79]);
    this->device_ip_ = ip_str;

    char name_buf[33] = {0};
    std::memcpy(name_buf, &data[42], 32);
    ESP_LOGI(TAG, "Discovered Switcher: %s (ID: %s, IP: %s, Key: 0x%02X)",
             name_buf, this->device_id_.c_str(), this->device_ip_.c_str(), this->device_key_);

    this->device_discovered_ = true;
  }

  // One-shot state override after command (prevents flicker)
  bool is_on = (data[133] == 0x01);
  if (this->pending_state_override_) {
    ESP_LOGD(TAG, "Using pending state override: %s (device reports: %s)",
             this->pending_state_ ? "ON" : "OFF", is_on ? "ON" : "OFF");
    this->publish_state(this->pending_state_);
    this->pending_state_override_ = false;
  } else {
    this->publish_state(is_on);
  }

  // Update sensors
  if (this->power_sensor_ != nullptr) {
    uint16_t power = data[135] | (data[136] << 8);
    this->power_sensor_->publish_state(static_cast<float>(power));
  }

  if (this->remaining_time_sensor_ != nullptr) {
    uint32_t remaining = data[147] | (data[148] << 8) | (data[149] << 16) | (data[150] << 24);
    this->remaining_time_sensor_->publish_state(static_cast<float>(remaining));
  }
}

void SwitcherDevice::write_state(bool state) {
  if (!this->device_discovered_) {
    ESP_LOGW(TAG, "Cannot control device - not yet discovered");
    return;
  }

  ESP_LOGI(TAG, "Switching %s", state ? "ON" : "OFF");

  if (this->send_command(state, 0)) {
    // Set one-shot override for next broadcast
    this->pending_state_ = state;
    this->pending_state_override_ = true;
    // Optimistic update
    this->publish_state(state);
  } else {
    ESP_LOGE(TAG, "Failed to send command");
  }
}

bool SwitcherDevice::send_command(bool turn_on, uint16_t timer_minutes) {
  // Create TCP socket
  auto tcp = socket::socket(AF_INET, SOCK_STREAM, IPPROTO_IP);
  if (tcp == nullptr) {
    ESP_LOGE(TAG, "Could not create TCP socket");
    return false;
  }

  // Connect to device
  struct sockaddr_in dest {};
  dest.sin_family = AF_INET;
  dest.sin_addr.s_addr = this->device_ip_numeric_;
  dest.sin_port = htons(TCP_CONTROL_PORT);

  if (tcp->connect((struct sockaddr *) &dest, sizeof(dest)) != 0) {
    ESP_LOGE(TAG, "Failed to connect to device");
    return false;
  }

  // Get current timestamp
  uint32_t timestamp = static_cast<uint32_t>(time(nullptr));

  // Build and send login packet
  auto login_packet = prepare_packet(build_login_packet(this->device_key_, timestamp));
  if (tcp->write(login_packet.data(), login_packet.size()) < 0) {
    ESP_LOGE(TAG, "Failed to send login packet");
    return false;
  }

  // Read login response
  uint8_t response[1024];
  auto resp_len = tcp->read(response, sizeof(response));
  if (resp_len < 12) {
    ESP_LOGE(TAG, "Login response too short: %d", resp_len);
    return false;
  }

  // Extract session ID (bytes 8-12)
  std::string session_id = hexlify(&response[8], 4);
  ESP_LOGD(TAG, "Got session ID: %s", session_id.c_str());

  // Build and send control packet
  auto control_packet = prepare_packet(
      build_control_packet(session_id, this->device_id_, turn_on, timer_minutes, timestamp));
  if (tcp->write(control_packet.data(), control_packet.size()) < 0) {
    ESP_LOGE(TAG, "Failed to send control packet");
    return false;
  }

  // Read control response
  resp_len = tcp->read(response, sizeof(response));
  ESP_LOGD(TAG, "Control response: %d bytes", resp_len);

  tcp->close();
  return true;
}

void SwitcherDevice::dump_config() {
  ESP_LOGCONFIG(TAG, "Switcher Device:");
  if (!this->device_id_.empty()) {
    ESP_LOGCONFIG(TAG, "  Device ID: %s", this->device_id_.c_str());
  } else {
    ESP_LOGCONFIG(TAG, "  Device ID: (auto-discover)");
  }
  if (this->device_discovered_) {
    ESP_LOGCONFIG(TAG, "  Device IP: %s", this->device_ip_.c_str());
    ESP_LOGCONFIG(TAG, "  Device Key: 0x%02X", this->device_key_);
  }
  LOG_SENSOR("  ", "Power", this->power_sensor_);
  LOG_SENSOR("  ", "Remaining Time", this->remaining_time_sensor_);
}

}  // namespace switcher_proxy
}  // namespace esphome
