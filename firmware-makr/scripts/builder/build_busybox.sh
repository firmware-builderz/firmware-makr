#!/bin/bash 



build_busybox() {
    URL="https://github.com/mirror/busybox.git"

    eco info "BUILDING: BUSYBOX!!!"
    sleep 1;
    
    mkdir -p $BUILDING
    cd $BUILDING

    if [ ! -d busybox ]; then
        eco info "CLONING BUSYBOX REPO..."
        sleep 1;
        git clone --depth=1 $URL
    fi

    cd busybox

    sleep 1;
    eco info "Configuring BUSYBOX..."
    make defconfig

    if [ -f "$BUILDER/configs/busybox/.config" ]; then
        eco info "USING CUSTOM CONFIG..."
        sleep 1;
        cp "$BUILDER/configs/busybox/.config" .config
    fi

    sleep 1;
    eco info "BUILDING BUSYBOX..."
    make -j$(nproc)

    sleep 1;
    eco info "Installing BUSYBOX..."
    make CONFIG_PREFIX=$ROOTFS install
    # sudo make install CONFIG_PREFIX=$ROOTFS

    # ln -sf $ROOTFS/bin/busybox $ROOTFS/bin/sh
    # ln -sf $ROOTFS/bin/busybox $ROOTFS/bin/ls
    # ln -sf $ROOTFS/bin/busybox $ROOTFS/bin/mkdir
    # ln -sf $ROOTFS/bin/busybox $ROOTFS/bin/rm
    # ln -sf $ROOTFS/bin/busybox $ROOTFS/bin/mount
    # ln -sf $ROOTFS/bin/busybox $ROOTFS/bin/umount
    # ln -sf $ROOTFS/bin/busybox $ROOTFS/bin/cat

    sleep 1;
    eco success "BUSYBOX BUILD SUCCESSFULLY!!!"
}


# build_busybox() {
#     # BusyBox von GitHub klonen
#     eco info "BUILDING: BUSYBOX!!!"
#     echo $BUILDING
#     git clone https://github.com/mirror/busybox.git $BUILDING/busybox
#     cd $BUILDING/busybox

#     sudo make defconfig
#     sudo cp -r $BUILDER/configs/busybox/.config .config

#     sudo make
#     sudo make install CONFIG_PREFIX=$ROOTFS

# }