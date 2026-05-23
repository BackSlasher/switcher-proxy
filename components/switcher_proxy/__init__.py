"""Switcher Proxy ESPHome component."""

import esphome.codegen as cg
import esphome.config_validation as cv
from esphome.components import switch, sensor
from esphome.const import (
    CONF_ID,
    CONF_DEVICES,
    UNIT_WATT,
    UNIT_SECOND,
    DEVICE_CLASS_POWER,
    DEVICE_CLASS_DURATION,
    STATE_CLASS_MEASUREMENT,
)

CODEOWNERS = ["@backslasher"]
DEPENDENCIES = ["network"]
AUTO_LOAD = ["switch", "sensor"]

switcher_ns = cg.esphome_ns.namespace("switcher_proxy")
SwitcherHub = switcher_ns.class_("SwitcherHub", cg.Component)
SwitcherDevice = switcher_ns.class_("SwitcherDevice", switch.Switch, cg.Component)

CONF_SWITCHER_ID = "switcher_id"
CONF_POWER_SENSOR = "power_sensor"
CONF_REMAINING_TIME_SENSOR = "remaining_time_sensor"

DEVICE_SCHEMA = switch.switch_schema(SwitcherDevice).extend(
    {
        cv.Optional(CONF_SWITCHER_ID): cv.string,
        cv.Optional(CONF_POWER_SENSOR): sensor.sensor_schema(
            unit_of_measurement=UNIT_WATT,
            device_class=DEVICE_CLASS_POWER,
            state_class=STATE_CLASS_MEASUREMENT,
            accuracy_decimals=0,
        ),
        cv.Optional(CONF_REMAINING_TIME_SENSOR): sensor.sensor_schema(
            unit_of_measurement=UNIT_SECOND,
            device_class=DEVICE_CLASS_DURATION,
            state_class=STATE_CLASS_MEASUREMENT,
            accuracy_decimals=0,
        ),
    }
)

CONFIG_SCHEMA = cv.Schema(
    {
        cv.GenerateID(): cv.declare_id(SwitcherHub),
        cv.Required(CONF_DEVICES): cv.ensure_list(DEVICE_SCHEMA),
    }
)


async def to_code(config):
    hub = cg.new_Pvariable(config[CONF_ID])
    await cg.register_component(hub, config)

    for device_config in config[CONF_DEVICES]:
        device = await switch.new_switch(device_config)
        await cg.register_component(device, device_config)

        cg.add(device.set_hub(hub))
        cg.add(hub.register_device(device))

        if CONF_SWITCHER_ID in device_config:
            cg.add(device.set_device_id(device_config[CONF_SWITCHER_ID]))

        if power_config := device_config.get(CONF_POWER_SENSOR):
            sens = await sensor.new_sensor(power_config)
            cg.add(device.set_power_sensor(sens))

        if time_config := device_config.get(CONF_REMAINING_TIME_SENSOR):
            sens = await sensor.new_sensor(time_config)
            cg.add(device.set_remaining_time_sensor(sens))
