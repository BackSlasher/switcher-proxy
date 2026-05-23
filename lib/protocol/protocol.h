#pragma once

#include <cstdint>
#include <cstddef>
#include <string>
#include <vector>
#include <optional>

namespace switcher {

struct DeviceState {
    std::string device_id;
    std::string device_name;
    uint16_t device_type;
    uint8_t device_key;
    uint32_t ip_addr;
    bool is_on;
    uint16_t power_watts;
    uint32_t remaining_seconds;
    uint32_t auto_shutdown_seconds;
};

// CRC-CCITT (0x1021 polynomial)
uint16_t crc16_ccitt(const uint8_t* data, size_t len, uint16_t init = 0x1021);

// Convert hex string to bytes
std::vector<uint8_t> unhexlify(const std::string& hex);

// Convert bytes to hex string
std::string hexlify(const uint8_t* data, size_t len);
std::string hexlify(const std::vector<uint8_t>& data);

// Sign a packet with CRC (appends 4 bytes)
std::string sign_packet_with_crc(const std::string& hex_packet);

// Set message length field in packet (bytes 2-3, little-endian)
std::string set_message_length(const std::string& hex_packet);

// Build login packet for Type 1 devices
// Returns hex string (not yet signed or length-set)
std::string build_login_packet(uint8_t device_key, uint32_t timestamp);

// Build control packet (on/off with optional timer)
// session_id: 8 hex chars from login response
// device_id: 6 hex chars
// turn_on: true for ON, false for OFF
// timer_minutes: 0 for no timer
std::string build_control_packet(
    const std::string& session_id,
    const std::string& device_id,
    bool turn_on,
    uint16_t timer_minutes,
    uint32_t timestamp
);

// Parse UDP broadcast packet (Type 1 devices, ~165 bytes)
std::optional<DeviceState> parse_broadcast(const uint8_t* data, size_t len);

// Extract session ID from login response (hex offset 16-24)
std::string extract_session_id(const uint8_t* data, size_t len);

// Prepare final packet: set length, sign, convert to binary
std::vector<uint8_t> prepare_packet(const std::string& hex_packet);

}  // namespace switcher
