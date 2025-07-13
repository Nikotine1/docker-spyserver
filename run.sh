#!/bin/bash
set -e

CONFIG=/etc/spyserver/spyserver.config

sed -i "s/bind_port.*/bind_port = ${BIND_PORT:=5555}/g" $CONFIG
sed -i "s/list_in_directory.*/list_in_directory = ${LIST_IN_DIRECTORY:=1}/g" $CONFIG
sed -i "s/owner_name.*/owner_name = ${OWNER_NAME:=}/g" $CONFIG
sed -i "s/owner_email.*/owner_email = ${OWNER_EMAIL:=}/g" $CONFIG
sed -i "s/antenna_type.*/antenna_type = ${ANTENNA_TYPE:=}/g" $CONFIG
sed -i "s/antenna_location.*/antenna_location = ${ANTENNA_LOCATION:=}/g" $CONFIG
sed -i "s/general_description.*/general_description = ${GENERAL_DESCRIPTION:=}/g" $CONFIG
sed -i "s/maximum_clients.*/maximum_clients = ${MAXIMUM_CLIENTS:=1}/g" $CONFIG
sed -i "s/^#\?maximum_session_duration.*/maximum_session_duration = ${MAXIMUM_SESSION_DURATION:=0}/g" $CONFIG
sed -i "s/allow_control.*/allow_control = ${ALLOW_CONTROL:=1}/g" $CONFIG
sed -i "s/device_type.*/device_type = ${DEVICE_TYPE:=Auto}/g" $CONFIG
sed -i "s/device_serial.*/device_serial = ${DEVICE_SERIAL:=0}/g" $CONFIG
sed -i "s/^#\?device_sample_rate.*/device_sample_rate = ${DEVICE_SAMPLE_RATE:=2048000}/g" $CONFIG
sed -i "s/^#\?force_8bit.*/force_8bit = ${FORCE_8BIT:=0}/g" $CONFIG
sed -i "s/^#\?maximum_bandwidth.*/maximum_bandwidth = ${MAXIMUM_BANDWIDTH:=15000}/g" $CONFIG
sed -i "s/fft_fps.*/fft_fps = ${FFT_FPS:=15}/g" $CONFIG
sed -i "s/fft_bin_bits.*/fft_bin_bits = ${FFT_BIN_BITS:=16}/g" $CONFIG
sed -i "s/^#\?initial_frequency.*/initial_frequency = ${INITIAL_FREQUENCY:=7100000}/g" $CONFIG
sed -i "s/^#\?minimum_frequency.*/minimum_frequency = ${MINIMUM_FREQUENCY:=0}/g" $CONFIG
sed -i "s/^#\?maximum_frequency.*/maximum_frequency = ${MAXIMUM_FREQUENCY:=35000000}/g" $CONFIG
sed -i "s/^#\?frequency_correction_ppb.*/frequency_correction_ppb = ${FREQ_CORR_PPB:=0}/g" $CONFIG
sed -i "s/^#\?initial_gain.*/initial_gain = ${INITIAL_GAIN:=5}/g" $CONFIG
sed -i "s/^#\?rtl_sampling_mode.*/rtl_sampling_mode = ${RTL_SAMPLING_MODE:=0}/g" $CONFIG
sed -i "s/^#\?converter_offset.*/converter_offset = ${CONVERTER_OFFSET:--120000000}/g" $CONFIG
sed -i "s/^#\?enable_bias_tee.*/enable_bias_tee = ${ENABLE_BIAS_TEE:=0}/g" $CONFIG
sed -i "s/input_buffer_size_ms.*/input_buffer_size_ms = ${INPUT_BUFFER_SIZE_MS:=50}/g" $CONFIG
sed -i "s/input_buffer_count.*/input_buffer_count = ${INPUT_BUFFER_COUNT:=10}/g" $CONFIG
sed -i "s/output_buffer_size_ms.*/output_buffer_size_ms = ${OUTPUT_BUFFER_SIZE_MS:=50}/g" $CONFIG

echo "Starting Spyserver"
exec spyserver $CONFIG