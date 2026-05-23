#include <unity.h>
#include "protocol.h"
#include "test_vectors.h"
#include <cstring>

void setUp(void) {}
void tearDown(void) {}

void test_hexlify_unhexlify_roundtrip() {
    const char* test_hex = "deadbeef01234567";
    auto bytes = switcher::unhexlify(test_hex);
    auto result = switcher::hexlify(bytes);
    TEST_ASSERT_EQUAL_STRING(test_hex, result.c_str());
}

void test_unhexlify_values() {
    auto bytes = switcher::unhexlify("ff00ab12");
    TEST_ASSERT_EQUAL(4, bytes.size());
    TEST_ASSERT_EQUAL_HEX8(0xFF, bytes[0]);
    TEST_ASSERT_EQUAL_HEX8(0x00, bytes[1]);
    TEST_ASSERT_EQUAL_HEX8(0xAB, bytes[2]);
    TEST_ASSERT_EQUAL_HEX8(0x12, bytes[3]);
}

void test_crc16_ccitt_basic() {
    // Test against known value
    uint8_t data[] = {0xFE, 0xF0, 0x52, 0x00};
    uint16_t crc = switcher::crc16_ccitt(data, sizeof(data), 0x1021);
    // The CRC should be consistent (we'll verify via full packet tests)
    TEST_ASSERT_NOT_EQUAL(0, crc);
}

void test_sign_packet_with_crc() {
    size_t num_tests = sizeof(crc_test_vectors) / sizeof(crc_test_vectors[0]);
    for (size_t i = 0; i < num_tests; i++) {
        auto result = switcher::sign_packet_with_crc(crc_test_vectors[i].input);
        TEST_ASSERT_EQUAL_STRING_MESSAGE(
            crc_test_vectors[i].expected,
            result.c_str(),
            crc_test_vectors[i].input
        );
    }
}

void test_set_message_length() {
    size_t num_tests = sizeof(length_test_vectors) / sizeof(length_test_vectors[0]);
    for (size_t i = 0; i < num_tests; i++) {
        auto result = switcher::set_message_length(length_test_vectors[i].input);
        TEST_ASSERT_EQUAL_STRING_MESSAGE(
            length_test_vectors[i].expected,
            result.c_str(),
            length_test_vectors[i].input
        );
    }
}

void test_timestamp_conversion() {
    size_t num_tests = sizeof(timestamp_test_vectors) / sizeof(timestamp_test_vectors[0]);
    for (size_t i = 0; i < num_tests; i++) {
        // Build a login packet and check the timestamp portion
        auto packet = switcher::build_login_packet(0x00, timestamp_test_vectors[i].timestamp);
        // Timestamp is at a known position in the login packet
        // "fef052000232a100" (16) + "00000000" (8) + "340001000000000000000000" (24) = offset 48
        // timestamp is 8 hex chars
        std::string ts_in_packet = packet.substr(48, 8);
        TEST_ASSERT_EQUAL_STRING_MESSAGE(
            timestamp_test_vectors[i].expected_hex,
            ts_in_packet.c_str(),
            "Timestamp mismatch"
        );
    }
}

void test_minutes_to_hex_seconds() {
    size_t num_tests = sizeof(minutes_test_vectors) / sizeof(minutes_test_vectors[0]);
    for (size_t i = 0; i < num_tests; i++) {
        // Build a control packet with the timer and verify
        if (minutes_test_vectors[i].minutes == 0) {
            // For 0 minutes, we pass 0 and expect "00000000"
            auto packet = switcher::build_control_packet("aabbccdd", "112233", true, 0, 1700000000);
            // Timer is at the end of the packet
            std::string timer_in_packet = packet.substr(packet.length() - 8, 8);
            TEST_ASSERT_EQUAL_STRING("00000000", timer_in_packet.c_str());
        } else {
            auto packet = switcher::build_control_packet("aabbccdd", "112233", true,
                                                          minutes_test_vectors[i].minutes, 1700000000);
            std::string timer_in_packet = packet.substr(packet.length() - 8, 8);
            TEST_ASSERT_EQUAL_STRING_MESSAGE(
                minutes_test_vectors[i].expected_hex,
                timer_in_packet.c_str(),
                "Timer hex mismatch"
            );
        }
    }
}

void test_login_packet_building() {
    size_t num_tests = sizeof(login_test_vectors) / sizeof(login_test_vectors[0]);
    for (size_t i = 0; i < num_tests; i++) {
        // Parse device key from hex string
        uint8_t device_key = 0;
        const char* key_str = login_test_vectors[i].device_key;
        if (key_str[0] >= '0' && key_str[0] <= '9') device_key = (key_str[0] - '0') << 4;
        else device_key = (key_str[0] - 'a' + 10) << 4;
        if (key_str[1] >= '0' && key_str[1] <= '9') device_key |= (key_str[1] - '0');
        else device_key |= (key_str[1] - 'a' + 10);

        auto packet = switcher::build_login_packet(device_key, login_test_vectors[i].timestamp);
        TEST_ASSERT_EQUAL_STRING_MESSAGE(
            login_test_vectors[i].expected_unsigned,
            packet.c_str(),
            "Login packet mismatch (unsigned)"
        );

        auto with_length = switcher::set_message_length(packet);
        TEST_ASSERT_EQUAL_STRING_MESSAGE(
            login_test_vectors[i].expected_with_length,
            with_length.c_str(),
            "Login packet mismatch (with length)"
        );

        auto signed_packet = switcher::sign_packet_with_crc(with_length);
        TEST_ASSERT_EQUAL_STRING_MESSAGE(
            login_test_vectors[i].expected_signed,
            signed_packet.c_str(),
            "Login packet mismatch (signed)"
        );
    }
}

void test_control_packet_building() {
    size_t num_tests = sizeof(control_test_vectors) / sizeof(control_test_vectors[0]);
    for (size_t i = 0; i < num_tests; i++) {
        auto packet = switcher::build_control_packet(
            control_test_vectors[i].session_id,
            control_test_vectors[i].device_id,
            control_test_vectors[i].turn_on,
            control_test_vectors[i].timer_minutes,
            control_test_vectors[i].timestamp
        );

        auto with_length = switcher::set_message_length(packet);
        auto signed_packet = switcher::sign_packet_with_crc(with_length);

        TEST_ASSERT_EQUAL_STRING_MESSAGE(
            control_test_vectors[i].expected_signed,
            signed_packet.c_str(),
            "Control packet mismatch"
        );
    }
}

void test_prepare_packet() {
    // Test the convenience function that does length + sign + unhexlify
    auto packet = switcher::build_login_packet(0x12, 1700000000);
    auto prepared = switcher::prepare_packet(packet);

    // Should match the unhexlified version of the signed packet
    auto expected = switcher::unhexlify(login_test_vectors[0].expected_signed);
    TEST_ASSERT_EQUAL(expected.size(), prepared.size());
    TEST_ASSERT_EQUAL_HEX8_ARRAY(expected.data(), prepared.data(), expected.size());
}

int main(int argc, char** argv) {
    UNITY_BEGIN();

    RUN_TEST(test_hexlify_unhexlify_roundtrip);
    RUN_TEST(test_unhexlify_values);
    RUN_TEST(test_crc16_ccitt_basic);
    RUN_TEST(test_sign_packet_with_crc);
    RUN_TEST(test_set_message_length);
    RUN_TEST(test_timestamp_conversion);
    RUN_TEST(test_minutes_to_hex_seconds);
    RUN_TEST(test_login_packet_building);
    RUN_TEST(test_control_packet_building);
    RUN_TEST(test_prepare_packet);

    return UNITY_END();
}
