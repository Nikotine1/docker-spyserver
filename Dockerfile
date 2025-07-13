# Builder stage
FROM debian:bookworm AS builder

RUN apt-get update && \
    apt-get purge ^librtlsdr && \
    rm -rvf /usr/lib/librtlsdr* /usr/include/rtl-sdr* /usr/local/lib/librtlsdr* /usr/local/include/rtl-sdr* /usr/local/include/rtl_* /usr/local/bin/rtl_* && \
    apt-get install wget kmod libncurses-dev libusb-1.0-0-dev git cmake pkg-config -y && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/rtlsdrblog/rtl-sdr-blog
RUN cd rtl-sdr-blog \
        && mkdir build \
        && cd build \
        && cmake ../ -DINSTALL_UDEV_RULES=ON \
        && make \
        && make install \
        && cp ../rtl-sdr.rules /etc/udev/rules.d/ \
        && ldconfig

# Runtime stage
FROM debian:bookworm-slim

RUN apt-get update && \
    apt-get install wget kmod libncurses-dev libusb-1.0-0-dev -y && \
    rm -rf /var/lib/apt/lists/*

COPY --from=builder /usr/local/lib/librtlsdr* /usr/local/lib/
COPY --from=builder /usr/local/bin/rtl_* /usr/local/bin/
COPY --from=builder /usr/local/include/rtl-sdr* /usr/local/include/
COPY --from=builder /etc/udev/rules.d/rtl-sdr.rules /etc/udev/rules.d/rtl-sdr.rules

RUN echo 'blacklist dvb_usb_rtl28xxu' | tee -a /etc/modprobe.d/blacklist-dvb_usb_rtl28xxu.conf

RUN wget https://airspy.com/downloads/spyserver-arm64.tgz && \
    tar xvzf spyserver-arm64.tgz && \
    rm spyserver-arm64.tgz && \
    mv spyserver /usr/bin && \
    chmod +x /usr/bin/spyserver && \
    mkdir -p /etc/spyserver && \
    mv spyserver.config /etc/spyserver

COPY run.sh .
RUN chmod +x run.sh
ENTRYPOINT ["./run.sh"]