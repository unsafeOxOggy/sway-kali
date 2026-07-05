#!/bin/bash
set -e
set -u
set -o pipefail 

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

echo_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

echo_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Verify that the script is executed from the correct directory
if [ ! -d "config" ]; then
    echo_error "config directory not found in the current working directory"
    echo_error "Make sure to run this script from the directory containing your config files"
    exit 1
fi

echo_info "Updating system package lists and upgrading packages..."
sudo apt-get update && sudo apt-get upgrade -y

echo_info "Installing the sway window manager environment..."
sudo apt-get install -y sway kitty neovim waybar rofi \
     grim slurp wl-clipboard libnotify-bin
   
# Create the local fonts directory
mkdir -p ~/.local/share/fonts/
# Install Nerd Fonts (Latest stable version)
echo_info "Installing Nerd Fonts..."
NERD_FONT_VERSION="v3.3.0"
wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/${NERD_FONT_VERSION}/RobotoMono.tar.xz
tar -xvf RobotoMono.tar.xz -C ~/.local/share/fonts/
rm RobotoMono.tar.xz
fc-cache -fv

# Create configuration directories
echo_info "Creating configuration directory structure..."
mkdir -p ~/.config/sway
mkdir -p ~/.config/rofi
mkdir -p ~/.config/waybar

# Deploy configuration files
echo_info "Copying configuration files..."
# ─── Sway config ────────────────────────────────────
cp -r config/sway/* ~/.config/sway
chmod +x ~/.config/sway/scripts/* 

# ─── rofi config ────────────────────────────────
cp  config/rofi/config.rasi ~/.config/rofi/config.rasi

# Copy wallpapers
if [ -d "config/sway/wallpaper" ]; then
    cp -r config/sway/wallpaper/* ~/.config/sway/wallpaper
    echo_info "Wallpapers successfully copied to ~/.config/sway/wallpaper"
fi

echo_info "═══════════════════════════════════════════════════════════"
echo_info "END!!!!"
echo_info "═══════════════════════════════════════════════════════════"
