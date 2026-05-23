#include "protocol.h"
#include <cstring>
#include <cstdio>

namespace switcher {

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

uint16_t crc16_ccitt(const uint8_t* data, size_t len, uint16_t init) {
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

std::vector<uint8_t> unhexlify(const std::string& hex) {
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

std::string hexlify(const uint8_t* data, size_t len) {
    std::string result;
    result.reserve(len * 2);
    for (size_t i = 0; i < len; i++) {
        result += int_to_hex_char((data[i] >> 4) & 0x0F);
        result += int_to_hex_char(data[i] & 0x0F);
    }
    return result;
}

std::string hexlify(const std::vector<uint8_t>& data) {
    return hexlify(data.data(), data.size());
}

std::string sign_packet_with_crc(const std::string& hex_packet) {
    // Convert hex packet to binary
    std::vector<uint8_t> binary = unhexlify(hex_packet);

    // Calculate CRC of the packet
    uint16_t packet_crc = crc16_ccitt(binary.data(), binary.size(), 0x1021);

    // Pack CRC as big-endian, then slice to get little-endian bytes 3,2 (indices 6:8, 4:6 in hex)
    // pack(">I", crc) gives [0, 0, high, low] for 16-bit value
    // hexlify gives "0000XXYY" where XX=high, YY=low
    // sliced [6:8] + [4:6] = YY + XX = little-endian
    char hex_crc[5];
    snprintf(hex_crc, sizeof(hex_crc), "%02x%02x",
             packet_crc & 0xFF, (packet_crc >> 8) & 0xFF);

    // Build the key: crc bytes + 32 bytes of 0x30
    std::vector<uint8_t> key(34);
    key[0] = packet_crc & 0xFF;
    key[1] = (packet_crc >> 8) & 0xFF;
    std::memset(&key[2], 0x30, 32);

    // Calculate CRC of the key
    uint16_t key_crc = crc16_ccitt(key.data(), key.size(), 0x1021);

    char hex_key_crc[5];
    snprintf(hex_key_crc, sizeof(hex_key_crc), "%02x%02x",
             key_crc & 0xFF, (key_crc >> 8) & 0xFF);

    return hex_packet + hex_crc + hex_key_crc;
}

std::string set_message_length(const std::string& hex_packet) {
    // Length = binary length of (packet + "00000000") = (hex_len/2) + 4
    size_t length = (hex_packet.length() / 2) + 4;

    // Format as little-endian hex, left-justified to 4 chars
    char len_hex[5];
    snprintf(len_hex, sizeof(len_hex), "%02x%02x",
             static_cast<unsigned>(length & 0xFF),
             static_cast<unsigned>((length >> 8) & 0xFF));

    // Replace bytes 2-3 (hex chars 4-7) with length
    // "fef0" + length + rest_of_packet[8:]
    return "fef0" + std::string(len_hex) + hex_packet.substr(8);
}

static std::string timestamp_to_hex(uint32_t ts) {
    char buf[9];
    snprintf(buf, sizeof(buf), "%02x%02x%02x%02x",
             ts & 0xFF,
             (ts >> 8) & 0xFF,
             (ts >> 16) & 0xFF,
             (ts >> 24) & 0xFF);
    return buf;
}

static std::string minutes_to_hex_seconds(uint16_t minutes) {
    uint32_t seconds = static_cast<uint32_t>(minutes) * 60;
    char buf[9];
    snprintf(buf, sizeof(buf), "%02x%02x%02x%02x",
             seconds & 0xFF,
             (seconds >> 8) & 0xFF,
             (seconds >> 16) & 0xFF,
             (seconds >> 24) & 0xFF);
    return buf;
}

// Packet templates
static const char* P_SESSION = "00000000";
static const char* PAD_72_ZEROS = "000000000000000000000000000000000000000000000000000000000000000000000000";

std::string build_login_packet(uint8_t device_key, uint32_t timestamp) {
    std::string ts_hex = timestamp_to_hex(timestamp);
    char key_hex[3];
    snprintf(key_hex, sizeof(key_hex), "%02x", device_key);

    // LOGIN_PACKET_TYPE1 format:
    // "fef052000232a100" + P_SESSION + "340001000000000000000000" + timestamp +
    // "00000000000000000000f0fe" + device_key + PAD_72_ZEROS + "00"
    std::string packet = "fef052000232a100";
    packet += P_SESSION;
    packet += "340001000000000000000000";
    packet += ts_hex;
    packet += "00000000000000000000f0fe";
    packet += key_hex;
    packet += PAD_72_ZEROS;
    packet += "00";

    return packet;
}

std::string build_control_packet(
    const std::string& session_id,
    const std::string& device_id,
    bool turn_on,
    uint16_t timer_minutes,
    uint32_t timestamp
) {
    std::string ts_hex = timestamp_to_hex(timestamp);
    std::string timer_hex = timer_minutes > 0 ? minutes_to_hex_seconds(timer_minutes) : "00000000";
    const char* command = turn_on ? "1" : "0";

    // SEND_CONTROL_PACKET format:
    // "fef05d0002320102" + session_id + "340001000000000000000000" + timestamp +
    // "00000000000000000000f0fe" + device_id + PAD_72_ZEROS + "000106000" + command + "00" + timer
    std::string packet = "fef05d0002320102";
    packet += session_id;
    packet += "340001000000000000000000";
    packet += ts_hex;
    packet += "00000000000000000000f0fe";
    packet += device_id;
    packet += PAD_72_ZEROS;
    packet += "000106000";
    packet += command;
    packet += "00";
    packet += timer_hex;

    return packet;
}

std::optional<DeviceState> parse_broadcast(const uint8_t* data, size_t len) {
    // Verify magic bytes and length
    if (len < 165) return std::nullopt;
    if (data[0] != 0xFE || data[1] != 0xF0) return std::nullopt;

    // Only handle Type 1 water heater packets (165 bytes) for now
    if (len != 165) return std::nullopt;

    DeviceState state;

    // Device ID at bytes 18-21 (hex offset 36-42)
    state.device_id = hexlify(&data[18], 3);

    // Device name at bytes 42-74 (null-terminated ASCII)
    char name_buf[33] = {0};
    std::memcpy(name_buf, &data[42], 32);
    state.device_name = name_buf;

    // Device type at bytes 74-76
    state.device_type = (static_cast<uint16_t>(data[75]) << 8) | data[74];

    // Device key at byte 40
    state.device_key = data[40];

    // IP address at bytes 76-80 (little-endian)
    state.ip_addr = data[76] | (data[77] << 8) | (data[78] << 16) | (data[79] << 24);

    // State at byte 133 (hex offset 266)
    state.is_on = (data[133] == 0x01);

    // Power consumption at bytes 135-136 (hex offset 270-274, little-endian, 2 bytes)
    state.power_watts = data[135] | (data[136] << 8);

    // Remaining time at bytes 147-150 (hex offset 294-302, little-endian)
    state.remaining_seconds = data[147] | (data[148] << 8) | (data[149] << 16) | (data[150] << 24);

    // Auto shutdown at bytes 155-158 (hex offset 310-318, little-endian)
    state.auto_shutdown_seconds = data[155] | (data[156] << 8) | (data[157] << 16) | (data[158] << 24);

    return state;
}

std::string extract_session_id(const uint8_t* data, size_t len) {
    // Session ID is at bytes 8-12 (hex offset 16-24)
    if (len < 12) return "";
    return hexlify(&data[8], 4);
}

std::vector<uint8_t> prepare_packet(const std::string& hex_packet) {
    std::string with_length = set_message_length(hex_packet);
    std::string signed_packet = sign_packet_with_crc(with_length);
    return unhexlify(signed_packet);
}

}  // namespace switcher
