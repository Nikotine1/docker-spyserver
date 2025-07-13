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
| `LIST_IN_DIRECTORY`          | `1`                | List Server in the [AirSpy Directory](https://airspy.com/directory/), `1` for yes, `0` for no |
| `OWNER_NAME`                 |                    | Name in the directory |
| `OWNER_EMAIL`                |                    | Directory contact |
| `ANTENNA_TYPE`              |                    | Random Wire / Magnetic Loop / Mini-Whip / Inverted V / etc. |
| `ANTENNA_LOCATION`           |                    | Latitude/Longitude, e.g. `48.858332, 2.294560` |
| `GENERAL_DESCRIPTION`        |                    | Description for the directory |
| `MAXIMUM_CLIENTS`            | `1`                | Maximum number of clients that can connect at a time |
| `MAXIMUM_SESSION_DURATION`   | `0`                | Maximum session duration in minutes. `0` for no limit |
| `ALLOW_CONTROL`              | `1`                | Allow clients to retune and change gain of the device |
| `DEVICE_TYPE`                | `Auto`             | Possible values: `AirspyOne`, `AirspyHF+`, `RTL-SDR`, `Auto` |
| `DEVICE_SERIAL`              | `0`                | Device serial number. For RTL-SDR: `0` = first device, `1` = second, etc. Use `rtl_test` to identify. For Airspy: 64-bit hex (e.g., `0xDD52D95C904534AD`) |
| `DEVICE_SAMPLE_RATE`         | `2048000`          | Device sample rate in Hz. Depends on SDR type |
| `FORCE_8BIT`                 | `0`                | Enable 8-bit compression to save bandwidth |
| `MAXIMUM_BANDWIDTH`          | `15000`            | Maximum IQ bandwidth (Hz) that clients can set |
| `FFT_FPS`                    | `15`               | FFT frames per second |
| `FFT_BIN_BITS`               | `16`               | FFT bins = 2^`FFT_BIN_BITS` |
| `INITIAL_FREQUENCY`          | `7100000`          | Initial center frequency in Hz |
| `MINIMUM_FREQUENCY`          | `0`                | Minimum tunable frequency in Hz |
| `MAXIMUM_FREQUENCY`          | `35000000`         | Maximum tunable frequency in Hz |
| `FREQ_CORR_PPB`              | `0`                | Frequency correction in parts per billion |
| `INITIAL_GAIN`               | `5`                | Initial tuner gain |
| `RTL_SAMPLING_MODE`          | `0`                | RTL-SDR mode: `0` = Quadrature, `1` = Direct Sampling I, `2` = Direct Sampling Q |
| `CONVERTER_OFFSET`           | `-120000000`       | Set to `-120000000` to enable SpyVerter offset |
| `ENABLE_BIAS_TEE`            | `0`                | For AirspyOne only – enables Bias-T for LNA or SpyVerter |
| `INPUT_BUFFER_SIZE_MS`       | `50`               | Input buffer size in milliseconds |
| `INPUT_BUFFER_COUNT`         | `10`               | Number of input buffers |
| `OUTPUT_BUFFER_SIZE_MS`      | `50`               | Output network buffer size in milliseconds |

