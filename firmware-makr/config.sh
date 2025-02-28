#!/bin/bash
# exports.sh


export BUILDER=$(pwd)
export BUILDING=$(pwd)/work
export BUSYBOX=$(pwd)/work/busybox

export BOOTFS=$(pwd)/work/bootfs
export ROOTFS=$(pwd)/work/rootfs


### IMPORT GLOBAL FUNCTIONS ### IMPORT GLOBAL FUNCTIONS IMPORT GLOBAL FUNCTIONS ######################
source /media/blackbyte/ssd/.global_scripts/colored.sh


### IMPORT BUILDER FUNCTIONS ### IMPORT BUILDER FUNCTIONS IMPORT BUILDER FUNCTIONS ###################
source $(pwd)/scripts/builder/build_configs.sh

source $(pwd)/scripts/builder/build_busybox.sh
source $(pwd)/scripts/builder/build_gcc.sh
source $(pwd)/scripts/builder/build_glibc.sh
source $(pwd)/scripts/builder/build_zlib.sh
source $(pwd)/scripts/builder/build_db.sh
source $(pwd)/scripts/builder/build_toolchain.sh
source $(pwd)/scripts/builder/build_bash.sh

source $(pwd)/scripts/builder/build_rpm.sh
source $(pwd)/scripts/builder/build_opkg.sh

source $(pwd)/scripts/builder/build_bootloader.sh
source $(pwd)/scripts/builder/build_image.sh


source $(pwd)/scripts/builder/set_permissions.sh


### END IMPORT BUILDER FUNCTIONS ### END IMPORT BUILDER FUNCTIONS ### END IMPORT BUILDER FUNCTIONS ###


