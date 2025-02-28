#!/bin/bash


# devices="console, tty1, null, zero, ttyS0, random, urandom, loop0, sda, sda1, pts, ptmx, shm"

build_devices() {
    eco info "!BUILDING: DEVICES!!! "
    echo $devices

    sudo mkdir -p $ROOTFS/dev

    # Console und TTY
    sudo mknod -m 600 $ROOTFS/dev/console c 5 1
    sudo mknod -m 600 $ROOTFS/dev/tty1 c 4 1

    # Null und Zero Geräte
    sudo mknod -m 666 $ROOTFS/dev/null c 1 3
    sudo mknod -m 666 $ROOTFS/dev/zero c 1 5

    # Serielle Schnittstelle
    sudo mknod -m 666 $ROOTFS/dev/ttyS0 c 4 64

    # Zufallsquellen
    sudo mknod -m 666 $ROOTFS/dev/random c 1 8
    sudo mknod -m 666 $ROOTFS/dev/urandom c 1 9

    # Loopback-Device
    sudo mknod -m 666 $ROOTFS/dev/loop0 b 7 0

    # PTS (Pseudoterminals)
    sudo mknod -m 700 $ROOTFS/dev/pts
    sudo mknod -m 666 $ROOTFS/dev/ptmx c 5 2
    sudo mknod -m 666 $ROOTFS/dev/pts/0 c 136 0

    # Shared Memory
    sudo mknod -m 1777 $ROOTFS/dev/shm

    # Blockgeräte (Festplatten)
    sudo mknod -m 666 $ROOTFS/dev/sda b 8 0
    sudo mknod -m 666 $ROOTFS/dev/sda1 b 8 1

    #   sudo mknod -m 666 $ROOTFS/dev/sda b 8 0
    #   sudo mknod -m 666 $ROOTFS/dev/sda1 b 8 1
    #   sudo mknod -m 666 $ROOTFS/dev/sda2 b 8 2

    eco info "Alle wichtigen Geräteeinträge wurden erstellt."
}