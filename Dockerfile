FROM debian:latest

RUN apt update

RUN apt purge ^librtlsdr
RUN rm -rvf /usr/lib/librtlsdr* /usr/include/rtl-sdr* /usr/local/lib/librtlsdr* /usr/local/include/rtl-sdr* /usr/local/include/rtl_* /usr/local/bin/rtl_*

RUN apt-get install wget kmod libncurses-dev libusb-1.0-0-dev git cmake pkg-config -y

RUN git clone https://github.com/rtlsdrblog/rtl-sdr-blog
RUN cd rtl-sdr-blog \
        && mkdir build \
        && cd build \
        && cmake ../ -DINSTALL_UDEV_RULES=ON \
        && make \
        && make install \
        && cp ../rtl-sdr.rules /etc/udev/rules.d/ \
        && ldconfig

RUN echo 'blacklist dvb_usb_rtl28xxu' | tee --append /etc/modprobe.d/blacklist-dvb_usb_rtl28xxu.conf

RUN wget https://airspy.com/downloads/spyserver-arm64.tgz; \
    tar xvzf spyserver-arm64.tgz; \
    rm spyserver-arm64.tgz;

RUN mv spyserver /usr/bin && \
    mkdir -p /etc/spyserver

COPY run.sh .
COPY spyserver.config .

ENTRYPOINT ["./run.sh"]