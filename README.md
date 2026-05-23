# Switcher Proxy

ESPHome component that proxies a [Switcher](https://www.switcher.co.il/) water heater from an isolated IoT network to Home Assistant.

## Why?

Switcher devices communicate via UDP broadcasts, which don't cross network boundaries. If your Switcher is on a separate IoT VLAN, you typically need a UDP relay on your router.

This component runs on an ESP32 in the IoT network and:
- Listens for Switcher UDP broadcasts (auto-discovery)
- Exposes the device to Home Assistant via ESPHome's native API
- Sends TCP commands to control on/off

No UDP relay needed. Home Assistant initiates the connection to the ESP32.

## Installation

Add to your ESPHome config:

```yaml
external_components:
  - source:
      type: git
      url: https://github.com/backslasher/switcher-proxy
      ref: main
    components: [switcher_proxy]

switcher_proxy:
  devices:
    - name: "Water Heater"
      # switcher_id: "aabbcc"  # omit to auto-discover first device
      power_sensor:
        name: "Water Heater Power"
      remaining_time_sensor:
        name: "Water Heater Time Remaining"
```

If `switcher_id` is omitted, the component locks onto the first Switcher it sees broadcasting. With multiple Switchers, specify the ID to avoid ambiguity.

### Finding your Switcher ID

Run this on any Linux machine on the same network as your Switcher:

```bash
sudo tcpdump -i any udp port 20002 -c 10 -w - 2>/dev/null | python3 -c '
import sys
seen, data, pos = set(), sys.stdin.buffer.read(), 24
while pos + 16 <= len(data):
    pkt_len = int.from_bytes(data[pos+8:pos+12], "little")
    pkt, pos = data[pos+16:pos+16+pkt_len], pos + 16 + pkt_len
    if len(pkt) < 117: continue
    payload = pkt[42:]
    device_id, name = payload[18:21].hex(), payload[42:74].rstrip(b"\x00").decode("utf-8", errors="ignore")
    if device_id not in seen: seen.add(device_id); print(f"switcher_id: \"{device_id}\"  # {name}")
'
```

Example output:
```
switcher_id: "ab12cd"  # Boiler
switcher_id: "ef34ab"  # Water Heater
```

## Configuration

```yaml
switcher_proxy:
  devices:
    - name: "Water Heater"
      switcher_id: "aabbcc"
      power_sensor:
        name: "Water Heater Power"
      remaining_time_sensor:
        name: "Water Heater Time Remaining"
    - name: "Boiler"
      switcher_id: "ddeeff"
      power_sensor:
        name: "Boiler Power"
```

### Options

| Option | Required | Description |
|--------|----------|-------------|
| `name` | Yes | Name of the switch entity |
| `switcher_id` | No | Filter for specific Switcher (hex, e.g., `aabbcc`). If omitted, locks onto first device seen. |
| `power_sensor` | No | Sensor for power consumption (watts) |
| `remaining_time_sensor` | No | Sensor for remaining run time (seconds) |

## Supported Devices

Currently supports Type 1 Switcher devices:
- Switcher V2
- Switcher Touch
- Switcher V4
- Switcher Mini
- Switcher Power Plug

## Development

Run protocol unit tests:

```bash
uv venv && uv pip install platformio
uv run pio test -e native
```

Regenerate test vectors from aioswitcher:

```bash
python3 scripts/generate_test_vectors.py > test/test_vectors.h
```

## License

MIT

## Credits

Protocol implementation based on [aioswitcher](https://github.com/TomerFi/aioswitcher).
