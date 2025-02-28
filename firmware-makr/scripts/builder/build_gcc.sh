#!/bin/bash


build_gmp() {
    URL="https://gmplib.org/download/gmp/gmp-6.2.1.tar.xz"
    DATEI="gmp-6.2.1.tar.xz"

    eco info "Installing GMP"
    cd $BUILDING
    sleep 1;

    if [ -e "$DATEI" ]; then
        eco info "Die Datei $DATEI existiert bereits."
        log info "Die Datei $DATEI existiert bereits."
        sleep 2;
    else
        eco warning "Die Datei $DATEI existiert noch nicht."
        log warning "Die Datei $DATEI existiert noch nicht."
        sleep 2;
        eco info "Downloading GCC 10.2.0"
        wget $URL
    fi

    sleep 1;
    eco info "Extracting GMP"
    log info "Extracting GMP"
    tar -xvf gmp-6.2.1.tar.xz
    cd gmp-6.2.1

    sleep 1;
    eco info "Configuring GMP"
    log info "Configuring GMP"
    sudo ./configure --prefix=$ROOTFS/usr --host=aarch64-linux-gnu --disable-shared

    sleep 1;
    eco info "Making GMP"
    log info "Making GMP"
    sudo make -j$(nproc)

    sleep 1;
    eco info "Making install GMP"
    log info "Making install GMP"
    sudo make install DESTDIR=$ROOTFS

    sleep 1;
    cd $BUILDING
    eco success "GMP installed"
    log succ "GMP installed"
}




build_mpfr() {
    DATEI="mpfr-4.1.0.tar.xz"
    URL="https://ftp.gnu.org/gnu/mpfr/mpfr-4.1.0.tar.xz"

    eco info "Installing MPFR"
    log info "Installing MPFR"
    cd $BUILDING
    sleep 1;

    if [ -e "$DATEI" ]; then
        eco info "Die Datei $DATEI existiert bereits."
        log info "Die Datei $DATEI existiert bereits."
        sleep 1;
    else
        eco warning "Die Datei $DATEI existiert noch nicht."
        log warn "Die Datei $DATEI existiert noch nicht."
        sleep 1;
        eco info "Downloading MPFR"
        log info "Downloading MPFR"
        sudo wget $URL


    fi

    sleep 1;
    eco info "Extracting MPFR"
    log info "Extracting MPFR"
    sudo tar -xvf $DATEI
    cd mpfr-4.1.0

    sleep 1;
    eco info "Configuring MPFR"
    log info "Configuring MPFR"
    sudo ./configure --prefix=$ROOTFS/usr --host=aarch64-linux-gnu --disable-shared

    sleep 1;
    eco info "Making MPFR"
    log info "Making MPFR"
    sudo make -j$(nproc)

    sleep 1;
    eco info "Making install MPFR"
    log info "Making install MPFR"
    sudo make install DESTDIR=$ROOTFS

    sleep 1;
    cd $BUILDING
    eco success "MPFR installed"
    log succ "MPFR installed"
}




build_mpc() {
    DATEI="mpc-1.2.1.tar.gz"
    URL="https://ftp.gnu.org/gnu/mpc/mpc-1.2.1.tar.gz"

    eco info "Installing MPC!!!"
    log info "Installing MPC!!!"
    cd $BUILDING
    sleep 1;

    if [ -e "$DATEI" ]; then
        eco info "Die Datei $DATEI existiert bereits."
        log info "Die Datei $DATEI existiert bereits."
        sleep 1;
    else
        eco warning "Die Datei $DATEI existiert noch nicht."
        log warn "Die Datei $DATEI existiert noch nicht"
        sleep 1;
        eco info "Downloading MPC!!!"
        log info "Downloading MPC!!!"
        sudo wget $URL
    fi

    sleep 1;
    eco info "Extracting MPC!!!"
    log info "Extracting MPC!!!"
    sudo tar -xvf mpc-1.2.1.tar.gz
    cd mpc-1.2.1

    sleep 1;
    eco info "Configuring MPC!!!"
    log info "Configuring MPC!!!"
    sudo CONFIG_SHELL=/bin/bash ./configure CONFIG_SHELL=/bin/bash --prefix=$ROOTFS/usr --host=aarch64-linux-gnu --disable-shared
    #sudo ./configure --prefix=$ROOTFS/usr --host=aarch64-linux-gnu --disable-shared

    sleep 1;
    eco info "Making MPC!!!"
    log info "Making MPC!!!"
    sudo make -j$(nproc)
    
    sleep 1;
    eco info "Making install MPC!!!"
    log info "Making install MPC!!!"
    sudo make install DESTDIR=$ROOTFS

    sleep 1;
    cd $BUILDING
    eco success "MPC installed"
    log succ "MPC installed"
}


build_make() {

    export CC=aarch64-linux-gnu-gcc
    export CXX=aarch64-linux-gnu-g++
    export AR=aarch64-linux-gnu-ar
    export RANLIB=aarch64-linux-gnu-ranlib
    export STRIP=aarch64-linux-gnu-strip
    export PATH=/usr/bin:$PATH  # Ensure cross-toolchain is in PATH

    eco info "Building Make!!!"
    log info "Building Make!!!"

    sleep 1;
    if [ -e "$DATEI" ]; then
        eco info "Die Datei $DATEI existiert bereits."
        log info "Die Datei $DATEI existiert bereits."
        sleep 1;
    else
        eco warning "Die Datei $DATEI existiert noch nicht."
        log warn "Die Datei $DATEI existiert noch nicht."
        sleep 1;
        eco info "Downloading GCC 10.2.0"
        log info "Downloading GCC 10.2.0"
        sudo wget http://ftp.gnu.org/gnu/make/make-4.4.tar.gz
    fi

    
    sudo tar -xvf make-4.4.tar.gz
    cd make-4.4

    eco info "Configuring Make!!!"
    log info "Configuring Make!!!"
    sudo ./configure --host=aarch64-linux-gnu --prefix=/usr

    eco info "Make Make!!!"
    log info "Make Make!!!"
    sudo make -j$(nproc)

    eco info "Install Make!!!"
    log info "Install Make!!!"
    sudo make install DESTDIR=$ROOTFS


}


build_gcc() {
    DATEI="gcc-10.2.0.tar.gz"
    URL="https://ftp.gnu.org/gnu/gcc/gcc-10.2.0/gcc-10.2.0.tar.gz"

    sleep 1;
    if [ -e "$DATEI" ]; then
        eco info "Die Datei $DATEI existiert bereits."
        log info "Die Datei $DATEI existiert bereits."
        sleep 1;
    else
        eco warning "Die Datei $DATEI existiert noch nicht."
        log warn "Die Datei $DATEI existiert noch nicht."
        sleep 1;
        eco info "Downloading GCC 10.2.0"
        log info "Downloading GCC 10.2.0"
        sudo wget $URL
    fi

    sleep 1;
    eco info "Extracting GCC 10.2.0"
    log info "Extracting GCC 10.2.0"
    sudo tar -xvzf gcc-10.2.0.tar.gz
    cd gcc-10.2.0
    sudo mkdir build
    cd build

    sleep 1;
    eco info "Configuring GCC 10.2.0"
    log info "Configuring GCC 10.2.0"
    sudo ../configure --target=aarch64-linux-gnu --prefix=$ROOTFS/usr --disable-multilib --enable-languages=c,c++

    sleep 1;
    eco info "Making GCC 10.2.0"
    log info "Making GCC 10.2.0"
    sudo make -j$(nproc)

    sleep 1;
    eco info "Installing GCC 10.2.0"
    log info "Installing GCC 10.2.0"
    sudo make install DESTDIR=$ROOTFS
}



