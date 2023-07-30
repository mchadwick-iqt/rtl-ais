FROM debian:bookworm-slim
LABEL "name"="rtl-ais" \
  "description"="AIS ship decoding using an RTL-SDR dongle" \
  "author"="Bryan Klofas KF6ZEO"

ENV APP=/usr/src/app

WORKDIR $APP

COPY . $APP

RUN apt update && apt install -y \
  rtl-sdr \
  librtlsdr-dev \
  libusb-1.0-0-dev \
  make \
  build-essential \
  pkg-config \
  make \ 
  && apt remove -y make build-essential pkg-config \
  && apt autoremove -y \
  && rm -rf /var/lib/apt/lists/*

CMD $APP/rtl_ais -n

