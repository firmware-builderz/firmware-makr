#!/bin/bash

build_zlib() {

    DATEI="zlib-1.2.11.tar.gz"
    URL="https://zlib.net/zlib-1.2.11.tar.gz"
    VERZEICHNIS="zlib-1.2.11"

    sleep 1;
    eco info "BUILDING: ZLIB!!!"
    cd $BUILDING

    if [ -e "$DATEI" ]; then
        eco info "Die Datei $DATEI existiert bereits."
        sleep 1;
    else
        eco warning "Die Datei $DATEI existiert noch nicht."
        sleep 1;
        eco info "DOWNLOADING ZLIB SOURCE CODE!!!"
        wget $URL
    fi
    
    sleep 1;   
    eco info "EXTRACTING ZLIB SOURCE CODE!!!"
    tar -xvzf $DATEI
    cd zlib-1.2.11

    sleep 1;
    eco info "CONFIGURING ZLIB!!!"
    ./configure --prefix=$ROOTFS/usr

    sleep 1;
    eco info "MAKING ZLIB!!!"
    make -j$(nproc)

    sleep 1;
    eco info "INSTALLING ZLIB!!!"
    make DESTDIR=$ROOTFS install

    sleep 1;
    cd $BUILDING
    eco success "ZLIB BUILD SUCCESSFULLY!!!"
}