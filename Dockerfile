FROM debian:jessie

RUN apt-get update \
    && apt-get -y install git autoconf libtool libtool-bin automake build-essential gettext wget \
    && rm -rf /var/lib/{apt,dpkg}/

RUN git clone https://github.com/mono/mono.git /tmp/mono \
    && cd /tmp/mono \
    && ./autogen.sh --prefix=/usr \
	    --sysconfdir=/etc \
	    --bindir=/usr/bin \
	    --sbindir=/usr/bin \
	    --disable-quiet-build \
	    --disable-system-aot \
	    --disable-static \
	    --with-mcs-docs=no \
    && make get-monolite-latest \
	&& make EXTERNAL_MCS=${PWD}/mcs/class/lib/monolite/basic.exe \
	&& make install \
	&& cd / && rm -rf /tmp/mono
