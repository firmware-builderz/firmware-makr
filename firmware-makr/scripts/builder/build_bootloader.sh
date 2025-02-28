#!/bin/bash
# build_bootloader.sh


build_bootloader() {
    URL="https://github.com/firmware-builderz/firmware.git"
    
    eco info "Building Bootloader..."
    eco info "Creating Bootloader Directory: $BUILDING/bootloader !!!..."

    mkdir -p "$BUILDING/bootloader"

    cd "$BUILDING" || { echo "Fehler: Kann $BUILDING nicht betreten."; exit 1; }

    if [ ! -d "$BUILDING/firmware" ]; then
        eco info "Klonen des Firmware-Repositories..."
        git clone --depth=1 $URL
    else
        eco warning "Repository bereits vorhanden, hole die neuesten Änderungen..."
        cd firmware && git pull && cd ..
    fi

    eco info "Kopiere Dateien aus dem 'boot'-Verzeichnis..."
    cp -r "$BUILDING/firmware/boot/"* "$BUILDING/bootloader/"
    eco info "Alle Dateien und Ordner wurden erfolgreich in $BUILDING/bootloader heruntergeladen."
}