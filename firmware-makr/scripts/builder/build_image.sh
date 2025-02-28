#!/bin/bash
#set -e





IMG="rpi-linux.img"
IMG_SIZE_MB=4096
LOOP_DEV=""




create_image() {
    # Image-Datei mit Partitionen erstellen
    eco info "CONFIGURE Settings..."
    read -p "Img-Name: " IMG
    read -p "IMG-Size: " IMG_SIZE_MB

    eco info "Creating Raspberry Pi Image! ... . ."
    eco info "[*] Erstelle ${IMG} (${IMG_SIZE_MB}MB)"

    sudo dd if=/dev/zero of=$IMG bs=1M count=$IMG_SIZE_MB

    eco info "Creating partitions!... .. ."
    sudo parted $IMG mklabel msdos
    sudo parted $IMG mkpart primary fat32 1MiB 256MiB
    sudo parted $IMG mkpart primary ext4 256MiB 100%

    eco info "Format partitions!... .. ."
    LOOP_DEV=$(sudo losetup -f --show $IMG)
    sudo partprobe $LOOP_DEV
    sudo mkfs.vfat ${LOOP_DEV}p1
    sudo mkfs.ext4 ${LOOP_DEV}p2

    eco info "Mounting partitions! /mnt/boot /mnt/rootfs"
    sudo mkdir -p /mnt/boot /mnt/rootfs
    sudo mount ${LOOP_DEV}p1 /mnt/boot
    sudo mount ${LOOP_DEV}p2 /mnt/rootfs

    eco info "Copying files to Image!... .. ."
    sudo cp -r $BOOTFS/* /mnt/boot/
    sudo cp -a $ROOTFS/* /mnt/rootfs/
    
    eco info "Unmounting!... .. ."
    sudo umount /mnt/boot /mnt/rootfs
    sudo losetup -d $LOOP_DEV
    eco success "[✔] Bootfähiges Image ${IMG} erstellt!"
    # Hier kommt dein Code für das Aushängen hin
}