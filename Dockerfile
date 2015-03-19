FROM debian:jessie

RUN apt-get update && apt-get -y install git autoconf libtool libtool-bin automake build-essential gettext wget

WORKDIR /tmp

RUN git clone https://github.com/mono/mono.git

WORKDIR /tmp/mono

RUN ./autogen.sh --prefix=/usr \
    --sysconfdir=/etc \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --disable-quiet-build \
    --disable-system-aot \
    --disable-static \
    --with-mcs-docs=no

RUN make get-monolite-latest
RUN make EXTERNAL_MCS=${PWD}/mcs/class/lib/monolite/basic.exe
RUN make install

WORKDIR /

RUN rm -rf /tmp/mono
