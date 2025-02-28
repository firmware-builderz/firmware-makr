#!/bin/bash



build_rpm() {
    DATEI="rpm-4.16.1.tar.bz2"
    URL="https://ftp.rpm.org/releases/rpm-4.16.x/rpm-4.16.1.tar.bz2"


    eco info "BUILDING: RPM!!!"
    cd $BUILDING
    sleep 1;

    if [ -e "$DATEI" ]; then
        eco info "Die Datei $DATEI existiert bereits."
        sleep 1;
    else
        eco warning "Die Datei $DATEI existiert noch nicht."
        sleep 1;
        eco info "DOWNLOADING RPM SOURCE CODE!!!"
        wget $URL
    fi
    
    sleep 1;
    eco info "EXTRACTING RPM SOURCE CODE!!!"
    tar -xjf $DATEI
    cd rpm-4.16.1

    sleep 1;
    eco info "CONFIGURING RPM!!!"
    ./configure --prefix=$ROOTFS/usr --exec-prefix=$ROOTFS/usr --bindir=$ROOTFS/usr/bin --libdir=$ROOTFS/usr/lib

    sleep 1;
    eco info "MAKING RPM!!!"
    make -j$(nproc)

    sleep 1;
    eco info "INSTALLING RPM!!!"
    make DESTDIR=$ROOTFS install
    
    sleep 1;
    cd $BUILDING
    eco success "RPM BUILD SUCCESSFULLY!!!"
}