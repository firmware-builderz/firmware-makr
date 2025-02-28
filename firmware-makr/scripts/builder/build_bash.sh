#!/bin/bash



build_bash() {
    DATEI="bash-5.1.tar.gz"
    URL="https://ftp.gnu.org/gnu/bash/bash-5.1.tar.gz"

    cd $BUILDING
    sleep 1;

    if [ -e "$DATEI" ]; then
        eco info "Die Datei $DATEI existiert bereits."
        sleep 1;
    else
        eco warning "Die Datei $DATEI existiert noch nicht."
        sleep 1;
        eco info "DOWNLOADING BASH SOURCE CODE!!!"
        wget $URL
    fi

    sleep 1;
    eco info "EXTRACTING BASH SOURCE CODE!!!"
    tar -xvf bash-5.1.tar.gz
    cd bash-5.1

    sleep 1;
    eco info "Configuring BASH!!!"
    ./configure --host=aarch64-linux-gnu --prefix=$ROOTFS/usr

    sleep 1;
    eco info "MAKING BASH!!!"
    make

    sleep 1;
    eco info "INSTALLING BASH!!!"
    make install DESTDIR=$ROOTFS

    sleep 1;
    cd $BUILDING
    eco success "BASH BUILT SUCCESSFULLY!!!"


}



# build_bash() {
#     DATEI="bash-5.1.tar.gz"
#     URL="https://ftp.gnu.org/gnu/bash/bash-5.1.tar.gz"

#     eco info "BUILDING: BASH!!!"
#     cd $BUILDING

#     if [ -e "$DATEI" ]; then
#         eco info "Die Datei  existiert bereits."
#     else
#         eco warning "Die Datei $DATEI existiert noch nicht."
#         eco info "DOWNLOADING BASH SOURCE CODE!!!"
#         wget -q $URL || { echo "Fehler beim Download von Bash"; exit 1; }
#     fi

    

#     eco info "EXTRACTING BASH SOURCE CODE!!!"
#     tar -xvzf bash-5.1.tar.gz || { echo "Fehler beim Extrahieren von Bash"; exit 1; }
#     cd bash-5.1

#     eco info "CONFIGURING BASH!!!"
  
#     # ./configure --prefix=$ROOTFS/usr \
#     #             --host=aarch64-linux-gnu \
#     #             --without-bash-malloc \
#     #             --disable-nls \
#     #             --enable-static-link \
#     #             --with-installed-readline || { echo "Fehler beim Konfigurieren von Bash"; exit 1; }

#     ./configure --host=aarch64-linux-gnu --prefix=$ROOTFS/usr --enable-static-link || { echo "Fehler beim Konfigurieren von Bash"; }


#     eco info "MAKING BASH!!!"
#     make || { echo "Fehler beim Erstellen von Bash"; }

#     eco info "INSTALLING BASH!!!"
#     make DESTDIR=$ROOTFS install || { echo "Fehler beim Installieren von Bash";  }

#     # Bash als Standardshell setzen
#     ln -sf $ROOTFS/usr/bin/bash $ROOTFS/bin/bash || { echo "Fehler beim Setzen des Symlinks";  }

#     cd $BUILDING
#     eco success "BASH BUILT SUCCESSFULLY!!!"
# }




# build_bash() {

#     eco info "BUILDING: BASH!!!"
#     cd $BUILDING

#     eco info "DOWNLOADING BASH SOURCE CODE!!!"
#     wget https://ftp.gnu.org/gnu/bash/bash-5.1.tar.gz

#     eco info "EXTRACTING BASH SOURCE CODE!!!"
#     tar -xvzf bash-5.1.tar.gz -C $ROOTFS/tmp
#     cd $ROOTFS/tmp/bash-5.1

#     eco info "CONFIGURING BASH!!!"
#     ./configure --prefix=$ROOTFS

#     eco info "MAKING BASH!!!"
#     make

#     eco info "INSTALLING BASH!!!"
#     sudo make install 
#     cd $BUILDING
#     eco success "BASH BUILD SUCCESSFULLY!!!"
# }

