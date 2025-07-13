#!/bin/bash
set -e

CONFIG=/etc/spyserver/spyserver.config

### Always update these with default fallbacks
sed -i "s/bind_port.*/bind_port = ${BIND_PORT:=5555}/g" $CONFIG
sed -i "s/list_in_directory.*/list_in_directory = ${LIST_IN_DIRECTORY:=0}/g" $CONFIG
sed -i "s/owner_name.*/owner_name = ${OWNER_NAME:=}/g" $CONFIG
sed -i "s/owner_email.*/owner_email = ${OWNER_EMAIL:=}/g" $CONFIG
sed -i "s/antenna_type.*/antenna_type = ${ANTENNA_TYPE:=}/g" $CONFIG
sed -i "s/antenna_location.*/antenna_location = ${ANTENNA_LOCATION:=}/g" $CONFIG
sed -i "s/general_description.*/general_description = ${GENERAL_DESCRIPTION:=}/g" $CONFIG
sed -i "s/maximum_clients.*/maximum_clients = ${MAXIMUM_CLIENTS:=1}/g" $CONFIG
sed -i "s/allow_control.*/allow_control = ${ALLOW_CONTROL:=1}/g" $CONFIG
sed -i "s/device_type.*/device_type = ${DEVICE_TYPE:=Auto}/g" $CONFIG
sed -i "s/device_serial.*/device_serial = ${DEVICE_SERIAL:=0}/g" $CONFIG
sed -i "s/fft_fps.*/fft_fps = ${FFT_FPS:=15}/g" $CONFIG
sed -i "s/fft_bin_bits.*/fft_bin_bits = ${FFT_BIN_BITS:=16}/g" $CONFIG
sed -i "s/input_buffer_size_ms.*/input_buffer_size_ms = ${INPUT_BUFFER_SIZE_MS:=50}/g" $CONFIG
sed -i "s/input_buffer_count.*/input_buffer_count = ${INPUT_BUFFER_COUNT:=10}/g" $CONFIG
sed -i "s/output_buffer_size_ms.*/output_buffer_size_ms = ${OUTPUT_BUFFER_SIZE_MS:=50}/g" $CONFIG

### Only modify these if the environment variable is explicitly set
[[ -n "$MAXIMUM_SESSION_DURATION" ]] && \
  sed -i "s/^#\?maximum_session_duration.*/maximum_session_duration = $MAXIMUM_SESSION_DURATION/g" $CONFIG

[[ -n "$INITIAL_FREQUENCY" ]] && \
  sed -i "s/^#\?initial_frequency.*/initial_frequency = $INITIAL_FREQUENCY/g" $CONFIG

[[ -n "$MINIMUM_FREQUENCY" ]] && \
  sed -i "s/^#\?minimum_frequency.*/minimum_frequency = $MINIMUM_FREQUENCY/g" $CONFIG

[[ -n "$MAXIMUM_FREQUENCY" ]] && \
  sed -i "s/^#\?maximum_frequency.*/maximum_frequency = $MAXIMUM_FREQUENCY/g" $CONFIG

[[ -n "$DEVICE_SAMPLE_RATE" ]] && \
  sed -i "s/^#\?device_sample_rate.*/device_sample_rate = $DEVICE_SAMPLE_RATE/g" $CONFIG

[[ -n "$FREQ_CORR_PPB" ]] && \
  sed -i "s/^#\?frequency_correction_ppb.*/frequency_correction_ppb = $FREQ_CORR_PPB/g" $CONFIG

[[ -n "$INITIAL_GAIN" ]] && \
  sed -i "s/^#\?initial_gain.*/initial_gain = $INITIAL_GAIN/g" $CONFIG

[[ -n "$FORCE_8BIT" ]] && \
  sed -i "s/^#\?force_8bit.*/force_8bit = $FORCE_8BIT/g" $CONFIG

[[ -n "$MAXIMUM_BANDWIDTH" ]] && \
  sed -i "s/^#\?maximum_bandwidth.*/maximum_bandwidth = $MAXIMUM_BANDWIDTH/g" $CONFIG

[[ -n "$RTL_SAMPLING_MODE" ]] && \
  sed -i "s/^#\?rtl_sampling_mode.*/rtl_sampling_mode = $RTL_SAMPLING_MODE/g" $CONFIG

[[ -n "$CONVERTER_OFFSET" ]] && \
  sed -i "s/^#\?converter_offset.*/converter_offset = $CONVERTER_OFFSET/g" $CONFIG

[[ -n "$ENABLE_BIAS_TEE" ]] && \
  sed -i "s/^#\?enable_bias_tee.*/enable_bias_tee = $ENABLE_BIAS_TEE/g" $CONFIG

echo "Starting Spyserver"
exec spyserver $CONFIG