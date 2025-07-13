# Docker AirSpy SpyServer

Docker container for [AirSpy SpyServer](https://airspy.com/download),  with updated drivers for support for [RTL-SDR Blog V4](https://www.rtl-sdr.com/V4/) USB dongle.

Currently only for arm64 (e.g. Raspberry Pi 4 and 5).

[Docker HUB](https://hub.docker.com/r/nikotine1/spyserver)

## Summary

The container provides you with the SpyServer application running on port 5555. It has been tested with an RTL-SDR Blog V4 device. There is a [docker-compose.yml](https://github.com/Nikotine1/docker-spyserver/blob/master/docker-compose.yml) file should you want to see how to correctly use the USB device. In fact, with `priviliged: true`, you no longer have to mount the USB device.

### Example

See [docker-compose.yml](https://github.com/Nikotine1/docker-spyserver/blob/master/docker-compose.yml)

### Configuration

All configuration for this Docker container is done via environmental variables with sane defaults. To change a setting, simply set the appropriate environment variable.

| Environment Variable         | Default Value      | Notes |
|:----------------------------:|:------------------:|:------|
| `BIND_PORT`                  | `5555`             | Port to run SpyServer on |
| `LIST_IN_DIRECTORY`          | `0`                | List server in the [AirSpy Directory](https://airspy.com/directory/) (`1` = yes, `0` = no) |
| `OWNER_NAME`                 | *(empty)*          | Name shown in directory (optional) |
| `OWNER_EMAIL`                | *(empty)*          | Contact email shown in directory (optional) |
| `ANTENNA_TYPE`               | *(empty)*          | Antenna description (e.g. Random Wire / Mini-Whip / X-50N) |
| `ANTENNA_LOCATION`           | *(empty)*          | GPS coordinates (e.g. `48.858332, 2.294560`) |
| `GENERAL_DESCRIPTION`        | *(empty)*          | General description shown in the directory |
| `MAXIMUM_CLIENTS`            | `1`                | Maximum simultaneous client connections |
| `MAXIMUM_SESSION_DURATION`   | *(unset = ignored)*| Max session length (in minutes). `0` = unlimited |
| `ALLOW_CONTROL`              | `1`                | Allow clients to retune frequency and adjust gain |
| `DEVICE_TYPE`                | `Auto`             | Options: `AirspyOne`, `AirspyHF+`, `RTL-SDR`, `Auto` |
| `DEVICE_SERIAL`              | `0`                | For RTL-SDR: index (e.g. `0`, `1`). For Airspy: 64-bit hex (e.g. `0xDD52D95C904534AD`) |
| `DEVICE_SAMPLE_RATE`         | *(unset = ignored)*| Sample rate (in Hz). Depends on device model |
| `FORCE_8BIT`                 | *(unset = ignored)*| Use 8-bit compression (`1` = enable) to save bandwidth |
| `MAXIMUM_BANDWIDTH`          | *(unset = ignored)*| Max tunable IQ bandwidth in Hz (e.g. `15000` for narrowband) |
| `FFT_FPS`                    | `15`               | FFT frames per second |
| `FFT_BIN_BITS`               | `16`               | FFT bins = `2^FFT_BIN_BITS` |
| `INITIAL_FREQUENCY`          | *(unset = ignored)*| Initial center frequency in Hz |
| `MINIMUM_FREQUENCY`          | *(unset = ignored)*| Minimum allowed frequency in Hz |
| `MAXIMUM_FREQUENCY`          | *(unset = ignored)*| Maximum allowed frequency in Hz |
| `FREQ_CORR_PPB`              | *(unset = ignored)*| Frequency correction (parts per billion) |
| `INITIAL_GAIN`               | *(unset = ignored)*| Initial tuner gain |
| `RTL_SAMPLING_MODE`          | *(unset = ignored)*| RTL-SDR mode: `0` = Quadrature, `1` = Direct I, `2` = Direct Q |
| `CONVERTER_OFFSET`           | *(unset = ignored)*| Set to `-120000000` to enable SpyVerter upconverter |
| `ENABLE_BIAS_TEE`            | *(unset = ignored)*| For AirspyOne only — enables Bias-T for LNA/SpyVerter |
| `INPUT_BUFFER_SIZE_MS`       | `50`               | Input buffer size (milliseconds) |
| `INPUT_BUFFER_COUNT`         | `10`               | Number of input buffers |
| `OUTPUT_BUFFER_SIZE_MS`      | `50`               | Output network buffer size (milliseconds) |
