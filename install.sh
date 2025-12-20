#!/bin/sh

LSPM_BIN="/usr/bin/lspm"
LSPM_ETC="/etc/lspm"
LSPM_URL="https://raw.githubusercontent.com/lspm-pkg/lspm/refs/heads/main/code/lspm"

echo "Weclome to LSPM Installer."
echo "LSPM is a lightweight, simple, and fast package manager"
echo
echo "Github: https://github.com/lspm-pkg/lspm"
echo "Mirrorhost: https://5136.cloud"
echo

confirm() {
    printf "%s [y/N]: " "$1"
    read ans
    case "$ans" in
        y|Y) return 0 ;;
        *) echo "Aborted by user."; exit 1 ;;
    esac
}

main() {
    [ "$(id -u)" -ne 0 ] && { log "This installer must be run as root."; exit 1; }
    command -v "wget" >/dev/null 2>&1 || { log "Required command 'wget' not found."; exit 1; }
    command -v "mkdir" >/dev/null 2>&1 || { log "Required command 'mkdir' not found."; exit 1; }
    command -v "chmod" >/dev/null 2>&1 || { log "Required command 'chmod' not found."; exit 1; }
    echo "Install LSPM to $LSPM_BIN and create $LSPM_ETC."
    confirm "Do you want to continue?"
    echo "Creating LSPM directory at $LSPM_ETC..."
    mkdir -p "$LSPM_ETC" || { log "Failed to create $LSPM_ETC"; exit 1; }
    echo "Downloading LSPM binary to $LSPM_BIN..."
    wget -qO "$LSPM_BIN" "$LSPM_URL" || { log "Failed to download LSPM binary."; exit 1; }
    chmod +x "$LSPM_BIN"
    echo
    echo "LSPM installation complete!"
    echo "Run 'lspm set' to add the default repository."
}

main
