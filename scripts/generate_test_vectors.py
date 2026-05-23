#!/usr/bin/env python3
"""Generate test vectors from aioswitcher for C++ unit tests."""

import sys
import time
from binascii import crc_hqx, hexlify, unhexlify
from struct import pack

# Replicate the exact functions from aioswitcher

def sign_packet_with_crc_key(hex_packet: str) -> str:
    """Sign the packets with the designated crc key."""
    binary_packet = unhexlify(hex_packet)
    binary_packet_crc = pack(">I", crc_hqx(binary_packet, 0x1021))
    hex_packet_crc = hexlify(binary_packet_crc).decode()
    hex_packet_crc_sliced = hex_packet_crc[6:8] + hex_packet_crc[4:6]

    binary_key = unhexlify(hex_packet_crc_sliced + "30" * 32)
    binary_key_crc = pack(">I", crc_hqx(binary_key, 0x1021))
    hex_key_crc = hexlify(binary_key_crc).decode()
    hex_key_crc_sliced = hex_key_crc[6:8] + hex_key_crc[4:6]

    return hex_packet + hex_packet_crc_sliced + hex_key_crc_sliced


def set_message_length(message: str) -> str:
    """Set the message length."""
    length = "{:x}".format(len(unhexlify(message + "00000000"))).ljust(4, "0")
    return "fef0" + str(length) + message[8:]


def minutes_to_hexadecimal_seconds(minutes: int) -> str:
    """Encode minutes to hexadecimal packed as little endian unsigned int."""
    return hexlify(pack("<I", minutes * 60)).decode()


def timestamp_to_hexadecimal(ts: int) -> str:
    """Generate hexadecimal representation of a timestamp."""
    binary_timestamp = pack("<I", ts)
    hex_timestamp = hexlify(binary_timestamp)
    return hex_timestamp.decode()


# Packet templates from aioswitcher
P_SESSION = "00000000"
PAD_72_ZEROS = "0" * 72
REQUEST_FORMAT_TYPE1 = "{}340001000000000000000000{}00000000000000000000f0fe"

LOGIN_PACKET_TYPE1 = (
    "fef052000232a100"
    + P_SESSION
    + REQUEST_FORMAT_TYPE1[2:]
    + "{}"
    + PAD_72_ZEROS
    + "00"
)

SEND_CONTROL_PACKET = (
    "fef05d0002320102" + REQUEST_FORMAT_TYPE1 + "{}" + PAD_72_ZEROS + "000106000{}00{}"
)


def build_login_packet(device_key: str, timestamp: int) -> str:
    """Build a login packet for Type1 devices."""
    ts_hex = timestamp_to_hexadecimal(timestamp)
    packet = LOGIN_PACKET_TYPE1.format(ts_hex, device_key)
    return packet


def build_control_packet(session_id: str, device_id: str, command: str,
                         timer_minutes: int, timestamp: int) -> str:
    """Build a control packet."""
    ts_hex = timestamp_to_hexadecimal(timestamp)
    timer = minutes_to_hexadecimal_seconds(timer_minutes) if timer_minutes > 0 else "00000000"
    packet = SEND_CONTROL_PACKET.format(session_id, ts_hex, device_id, command, timer)
    return packet


def generate_test_vectors():
    """Generate test vectors and output as C++ code."""

    print("// Auto-generated test vectors from aioswitcher")
    print("// DO NOT EDIT - regenerate with scripts/generate_test_vectors.py")
    print()

    # Test vector 1: CRC signing of a simple packet
    test_packets = [
        "fef05200",
        "fef052000232a100",
        "fef052000232a10000000000340001000000000000000000",
    ]

    print("// CRC signing test vectors")
    print("struct CrcTestVector {")
    print("    const char* input;")
    print("    const char* expected;")
    print("};")
    print()
    print("static const CrcTestVector crc_test_vectors[] = {")
    for packet in test_packets:
        signed = sign_packet_with_crc_key(packet)
        print(f'    {{"{packet}", "{signed}"}},')
    print("};")
    print()

    # Test vector 2: Message length setting
    print("// Message length test vectors")
    print("struct LengthTestVector {")
    print("    const char* input;")
    print("    const char* expected;")
    print("};")
    print()

    # Create a packet that needs length setting
    length_tests = [
        "fef000000232a10000000000340001000000000000000000aabbccdd00000000000000000000f0fe1200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
    ]

    print("static const LengthTestVector length_test_vectors[] = {")
    for packet in length_tests:
        result = set_message_length(packet)
        print(f'    {{"{packet}",')
        print(f'     "{result}"}},')
    print("};")
    print()

    # Test vector 3: Full login packet
    print("// Login packet test vectors")
    print("struct LoginTestVector {")
    print("    const char* device_key;")
    print("    uint32_t timestamp;")
    print("    const char* expected_unsigned;")
    print("    const char* expected_with_length;")
    print("    const char* expected_signed;")
    print("};")
    print()

    login_tests = [
        ("12", 1700000000),
        ("ab", 1609459200),
    ]

    print("static const LoginTestVector login_test_vectors[] = {")
    for device_key, ts in login_tests:
        packet = build_login_packet(device_key, ts)
        with_length = set_message_length(packet)
        signed = sign_packet_with_crc_key(with_length)
        print(f'    {{"{device_key}", {ts}u,')
        print(f'     "{packet}",')
        print(f'     "{with_length}",')
        print(f'     "{signed}"}},')
    print("};")
    print()

    # Test vector 4: Control packet
    print("// Control packet test vectors")
    print("struct ControlTestVector {")
    print("    const char* session_id;")
    print("    const char* device_id;")
    print("    bool turn_on;")
    print("    uint16_t timer_minutes;")
    print("    uint32_t timestamp;")
    print("    const char* expected_signed;")
    print("};")
    print()

    control_tests = [
        ("aabbccdd", "112233", True, 0, 1700000000),
        ("aabbccdd", "112233", False, 0, 1700000000),
        ("aabbccdd", "112233", True, 30, 1700000000),
        ("12345678", "abcdef", True, 60, 1609459200),
    ]

    print("static const ControlTestVector control_test_vectors[] = {")
    for session_id, device_id, turn_on, timer, ts in control_tests:
        command = "1" if turn_on else "0"
        packet = build_control_packet(session_id, device_id, command, timer, ts)
        with_length = set_message_length(packet)
        signed = sign_packet_with_crc_key(with_length)
        print(f'    {{"{session_id}", "{device_id}", {"true" if turn_on else "false"}, {timer}u, {ts}u,')
        print(f'     "{signed}"}},')
    print("};")
    print()

    # Test vector 5: Timestamp conversion
    print("// Timestamp conversion test vectors")
    print("struct TimestampTestVector {")
    print("    uint32_t timestamp;")
    print("    const char* expected_hex;")
    print("};")
    print()

    ts_tests = [1700000000, 1609459200, 0, 0xFFFFFFFF]

    print("static const TimestampTestVector timestamp_test_vectors[] = {")
    for ts in ts_tests:
        hex_ts = timestamp_to_hexadecimal(ts)
        print(f'    {{{ts}u, "{hex_ts}"}},')
    print("};")
    print()

    # Test vector 6: Minutes to hex seconds
    print("// Minutes to hex seconds test vectors")
    print("struct MinutesTestVector {")
    print("    uint16_t minutes;")
    print("    const char* expected_hex;")
    print("};")
    print()

    min_tests = [0, 1, 30, 60, 120]

    print("static const MinutesTestVector minutes_test_vectors[] = {")
    for mins in min_tests:
        hex_secs = minutes_to_hexadecimal_seconds(mins) if mins > 0 else "00000000"
        print(f'    {{{mins}u, "{hex_secs}"}},')
    print("};")


if __name__ == "__main__":
    generate_test_vectors()
