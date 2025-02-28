#!/bin/bash

# GitHub Repository URL
REPO_URL="https://github.com/firmware-builderz/raspberry-pi-bootloader"
# Der Zielordner auf GitHub, den du herunterladen möchtest
FOLDER_PATH="Raspberry%20Pi%205"

# Basis-URL für die GitHub API
API_URL="https://api.github.com/repos/firmware-builderz/raspberry-pi-bootloader/contents/$FOLDER_PATH"

# Hilfsfunktion, um einen Ordner rekursiv herunterzuladen
download_folder() {
    local folder_url=$1
    local target_dir=$2

    # Hole die Inhalte des Ordners von der GitHub-API
    echo "Lade Inhalt von $folder_url herunter..."
    curl -s "$folder_url" | jq -r '.[] | {name, type, download_url, path}' | while read -r file; do
        # Extrahiere den Dateityp und die URL
        local name=$(echo $file | jq -r '.name')
        local type=$(echo $file | jq -r '.type')
        local download_url=$(echo $file | jq -r '.download_url')
        local path=$(echo $file | jq -r '.path')

        # Wenn es eine Datei ist, lade sie herunter
        if [[ "$type" == "file" ]]; then
            echo "Lade Datei: $path herunter..."
            mkdir -p "$target_dir/$(dirname "$path")"  # Erstelle das Verzeichnis, falls nötig
            wget -q -O "$target_dir/$path" "$download_url"
        elif [[ "$type" == "dir" ]]; then
            # Wenn es ein Ordner ist, rufe die Funktion rekursiv auf
            download_folder "https://api.github.com/repos/firmware-builderz/raspberry-pi-bootloader/contents/$path" "$target_dir"
        fi
    done
}


