FROM alpine

ARG slaxurl=https://github.com/Juniper/libslax/releases/download/0.22.1/libslax-0.22.1.tar.gz

RUN \
    set -e ; \
    cd ~ ; \
    apk add --no-cache --virtual build-reqs \
    git \
    curl-dev \
    libxslt-dev \
    libxml2-dev \
    bison \
    autoconf \
    build-base \
    automake \
    libtool \
    libbsd-dev ; \
    apk add --no-cache \
    libcurl \
    libxslt \
    libxml2 \
    libbsd ; \
    wget "$slaxurl" ; \
    tar xvf libslax* ; \
    cd libslax* ; \
    rm configure || true ; \
    mkdir -p m4 ; \
    autoreconf --install ; \
    mkdir -p build ; \
    cd build ; \
    echo '#define GLOB_BRACE (1 << 10)' >> /usr/include/glob.h ; \
    ../configure ; \
    make ; \
    make install ; \
    cd ~ ; \
    rm -rf libslax* ; \
    apk del --purge build-reqs

USER 65534:65534
ENTRYPOINT [ "/usr/local/bin/slaxproc" ]


