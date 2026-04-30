#!/usr/bin/env bash

set -e

CONFIG_DIR="$HOME/.config/bash"


install_bashconfig_deps() {
  local pkg_manager=""
  local install_cmd=""
  local pkgs=""
  # Detect package manager
  if command -v apt &>/dev/null; then
    pkg_manager="apt"
    install_cmd="sudo apt install -y"
  elif command -v dnf &>/dev/null; then
    pkg_manager="dnf"
    install_cmd="sudo dnf install -y"
  elif command -v yum &>/dev/null; then
    pkg_manager="yum"
    install_cmd="sudo yum install -y"
  elif command -v pacman &>/dev/null; then
    pkg_manager="pacman"
    install_cmd="sudo pacman -S --noconfirm"
  elif command -v zypper &>/dev/null; then
    pkg_manager="zypper"
    install_cmd="sudo zypper install -y"
  elif command -v apk &>/dev/null; then
    pkg_manager="apk"
    install_cmd="sudo apk add"
  elif command -v brew &>/dev/null; then
    pkg_manager="brew"
    install_cmd="brew install"
  else
    echo "No supported package manager found!"
    echo "Supported: apt, dnf, yum, pacman, zypper, apk, brew"
    return 1
  fi
  echo "Detected package manager: $pkg_manager"
  echo ""
  # Define packages based on package manager
  case "$pkg_manager" in
    apt)
      pkgs="eza bat ripgrep neovim unzip tar bzip2 gzip p7zip-full unrar less curl"
      ;;
    dnf|yum)
      pkgs="eza bat ripgrep neovim unzip tar bzip2 gzip p7zip unrar less curl"
      ;;
    pacman)
      pkgs="eza bat ripgrep neovim unzip tar bzip2 gzip p7zip unrar less curl"
      ;;
    zypper)
      pkgs="eza bat ripgrep neovim unzip tar bzip2 gzip p7zip unrar less curl"
      ;;
    apk)
      pkgs="eza bat ripgrep neovim unzip tar bzip2 gzip p7zip unrar less curl"
      ;;
    brew)
      pkgs="eza bat ripgrep neovim unzip gnu-tar bzip2 gzip p7zip unrar less curl"
      ;;
  esac
  echo "Installing packages: $pkgs"
  echo "Running: $install_cmd $pkgs"
  echo ""
  $install_cmd $pkgs
  # Install additional tools not in repos
  echo ""
  echo "Installing starship (cross-shell prompt)..."
  if ! command -v starship &>/dev/null; then
    curl -sS https://starship.rs/install.sh | sh -s -- -y
  else
    echo "starship already installed"
  fi
  echo ""
  echo "Installing zoxide (smarter cd)..."
  if ! command -v zoxide &>/dev/null; then
    curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
  else
    echo "zoxide already installed"
  fi
  echo ""
  echo "Installing mise (runtime version manager)..."
  if ! command -v mise &>/dev/null; then
    curl https://mise.run | sh
  else
    echo "mise already installed"
  fi
  echo ""
  echo "[✓] Dependencies installed"
}


echo "[*] Installing bash config..."

# Install dependencies first
install_bashconfig_deps

mkdir -p "$CONFIG_DIR"

cp -r config/* "$CONFIG_DIR/"
mv "$CONFIG_DIR/starship.toml" "$HOME/.config/starship.toml"

# Copy local.example.sh if no local.sh exists
if [ ! -f "$CONFIG_DIR/local.sh" ]; then
    cp "$CONFIG_DIR/local.example.sh" "$CONFIG_DIR/local.sh"
fi

if [ -f "$HOME/.bashrc" ]; then
    mv "$HOME/.bashrc" "$HOME/.bashrc.backup"
    echo "[*] Backed up existing .bashrc to .bashrc.backup"
fi

cp bashrc "$HOME/.bashrc"

echo "[✓] Installation complete!"
echo "→ Restart your shell or run: source ~/.bashrc"
