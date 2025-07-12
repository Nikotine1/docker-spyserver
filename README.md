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

| Environment Variable     | Default Value | Notes |
|:------------------------:|:-------------:|:------|
|`BIND_PORT`               |`5555`         |Port to run SpyServer on|
|`LIST_IN_DIRECTORY`       |`1`            |List Server in the [AirSpy Directory](https://airspy.com/directory/), `1` for yes, `0` for no|
|`OWNER_NAME`              |               |Name in the directory|
|`OWNER_EMAIL`             |               |Directory contact|
|`ANTENNA_TYPE`            |               |Random Wire/Magnetic Loop/Mini-Whip/Inverted V/etc.|
|`ANTENNA_LOCATION`        |               |Lat/Long, eg. `48.858332, 2.294560`|
|`GENERAL_DESCRIPTION`     |               |Description for the directory|
|`MAXIMUM_CLIENTS`         |`1`            |Maximum number of clients that can connect at a time|
|`MAXIMUM_SESSION_DURATION`|`0`            |Maximum session duration in minutes. `0` for no limit|
|`AlLOW_CONTROL`           |`1`            |Allow clients to retune and change of gain of the device|
|`DEVICE_TYPE`             |`Auto`         |Possible Values: `AirspyOne`, `AirspyHF+`, `RTL-SDR`, `Auto` (Scans for the first available device)|
|`DEVICE_SERIAL`           |`0`            |Device Serial Number. This causes much confusement when using RTL-SDR, according to the many forum posts online. For Airspy this is a 64bit hex eg. `0xDD52D95C904534AD`. For RTL-SDR, you need to check `rtl_test`to see a list of available devices, and use the number at the beginning of the line. The serial number, even when set with `rtl_eeprom` doesn't work.<br><br>$ rtl_test<br>Found 2 device(s):<br>0:  RTLSDRBlog, Blog V4, SN: 12345601<br>1:  RTLSDRBlog, Blog V4, SN: 12345602<br><br>Use `DEVICE_SERIAL=1`to select the second device.<br>A value of `0` will acquire the first available device.|
|`FFT_FPS`                 |`15`           |FFT Frames Per Second|
|`FFT_BIN_BITS`            |`16`           |FFT Bins, Bins = 2^fft_bin_bits|
|`INITIAL_FREQUENCY`       |`7100000`      |Initial Center Frequency|
|`BUFFER_SIZE_MS`          |`50`           |Buffer Size (in milliseconds)|
|`BUFFER_COUNT`            |`10`           |Buffer Count|
