#!/bin/bash

build_db() {
    DATEI="db-18.1.40.tar.gz"
    URL="https://download.oracle.com/berkeley-db/db-18.1.40.tar.gz"
    sleep 1;

    eco info "BUILDING: DB!!!"
    cd $BUILDING
    
    sleep 1;
    if [ -e "$DATEI" ]; then
        eco info "Die Datei $DATEI existiert bereits."
        sleep 1;
    else
        eco warning "Die Datei $DATEI existiert noch nicht."
        eco info "Downloading DB SOURCE CODE!!!"
        wget $URL
        sleep 1;
    fi
    
    eco info "Extracting DB SOURCE CODE!!!"
    tar -xvzf $DATEI
    cd db-18.1.40

    sleep 1;
    eco info "Configuring DB!!!"
    ../dist/configure --prefix=$ROOTFS/usr

    sleep 1;
    eco info "Making DB!!!"
    make -j$(nproc)

    sleep 1;
    eco info "Installing DB!!!"
    make DESTDIR=$ROOTFS install
    
    sleep 1;
    cd $BUILDING
    eco success "DB BUILD SUCCESSFULLY!!!"
}