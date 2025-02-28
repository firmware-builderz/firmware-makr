#!/bin/bash


build_glibc() {
    DATEI="glibc-2.34.tar.gz"
    URL="http://ftp.gnu.org/gnu/libc/glibc-2.34.tar.gz"

    eco info "BUILDING: GLIBC!!!"
    cd $BUILDING
    sleep 1;

    if [ -e "$DATEI" ]; then
        eco info "Die Datei $DATEI existiert bereits."
        sleep 1;
    else
        eco warning "Die Datei $DATEI existiert noch nicht."
        sleep 1;
        eco info "Downloading GLIBC SOURCE CODE!!!"
        wget $URL
    fi
    sleep 1;
    eco info "Extracting GLIBC SOURCE CODE!!!"
    tar -xvzf $DATEI

    sleep 1;
    cd glibc-2.34
    mkdir build
    cd build

    eco info "Configuring GLIBC!!!"
    ../configure --prefix=$ROOTFS/usr

    sleep 1;
    eco info "Making GLIBC!!!"
    make -j$(nproc)

    sleep 1;
    eco info "Installing GLIBC!!!"
    make DESTDIR=$ROOTFS install
    
    sleep 1;
    cd $BUILDING
    eco success "GLIBC BUILD SUCCESSFULLY!!!"
}