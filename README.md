# Zephyr™ Mechanical Keyboard (ZMK) Firmware

[![Discord](https://img.shields.io/discord/719497620560543766)](https://zmk.dev/community/discord/invite)
[![Build](https://github.com/zmkfirmware/zmk/workflows/Build/badge.svg)](https://github.com/zmkfirmware/zmk/actions)
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-v2.0%20adopted-ff69b4.svg)](CODE_OF_CONDUCT.md)

[ZMK Firmware](https://zmk.dev/) is an open source ([MIT](LICENSE)) keyboard firmware built on the [Zephyr™ Project](https://www.zephyrproject.org/) Real Time Operating System (RTOS). ZMK's goal is to provide a modern, wireless, and powerful firmware free of licensing issues.

Check out the website to learn more: https://zmk.dev/.

You can also come join our [ZMK Discord Server](https://zmk.dev/community/discord/invite).

To review features, check out the [feature overview](https://zmk.dev/docs/). ZMK is under active development, and new features are listed with the [enhancement label](https://github.com/zmkfirmware/zmk/issues?q=is%3Aissue+is%3Aopen+label%3Aenhancement) in GitHub. Please feel free to add 👍 to the issue description of any requests to upvote the feature.


# build wireless ergodox

sh build_in_docker.sh west build -b nrf52840_dongle -- -DSHIELD=wireless_ergodox_dongle

in nRFConnect -> Programmer
- add file app/build/zephyr/zmk.hex
- add file s140_nrf52_7.2.0_softdevice.hex (download it from nordic page)
- write

if re-flashing softdevice file can be omitted:
- add file app/build/zephyr/zmk.hex
- write and select soft device "0x100 (s140_nrf52_7.2.0)"

for first time or update zmk repeat with wireless_ergodox_right and wireless_ergodox_left
