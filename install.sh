#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")" && pwd)"

echo "[*] Repo root: $REPO_ROOT"

############################
# Detect OS
############################
OS="$(uname | tr '[:upper:]' '[:lower:]')"

############################
# Install dependencies
############################
echo "[*] Installing dependencies..."

if [[ "$OS" == "linux" ]]; then
  if command -v snap >/dev/null 2>&1; then
    sudo snap install nvim --classic || true
  else
    sudo apt update
    sudo apt install -y neovim tmux git
  fi
elif [[ "$OS" == "darwin" ]]; then
  if command -v brew >/dev/null 2>&1; then
    brew install neovim tmux git
  else
    echo "[!] Homebrew not found. Install it first."
    exit 1
  fi
fi

############################
# Setup Neovim
############################
echo "[*] Setting up Neovim..."

NVIM_TARGET="$HOME/.config/nvim"
mkdir -p "$HOME/.config"

rm -rf "$NVIM_TARGET"
mkdir -p "$NVIM_TARGET"

rsync -av \
  --exclude ".tmux.conf" \
  --exclude "install.sh" \
  "$REPO_ROOT/" "$NVIM_TARGET/"

echo "[+] Neovim config installed"

############################
# Setup tmux
############################
echo "[*] Setting up tmux..."

TMUX_CONF_SOURCE="$REPO_ROOT/.tmux.conf"
TMUX_CONF_TARGET="$HOME/.tmux.conf"
TPM_DIR="$HOME/.tmux/plugins/tpm"

mkdir -p "$HOME/.tmux/plugins"

if [ ! -d "$TPM_DIR" ]; then
  git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
fi

cp "$TMUX_CONF_SOURCE" "$TMUX_CONF_TARGET"

echo "[+] tmux config copied"

############################
# Auto-start tmux (safe)
############################
echo "[*] Configuring shell auto-start for tmux..."

TMUX_BLOCK='
# >>> tmux auto-start >>>
if command -v tmux >/dev/null 2>&1; then
  if [ -z "$TMUX" ] && [ -n "$PS1" ]; then
    exec tmux
  fi
fi
# <<< tmux auto-start <<<
'

add_to_rc() {
  local file="$1"
  if [ -f "$file" ]; then
    if ! grep -q "tmux auto-start" "$file"; then
      printf "\n%s\n" "$TMUX_BLOCK" >> "$file"
      echo "[+] Updated $file"
    else
      echo "[=] tmux auto-start already present in $file"
    fi
  fi
}

add_to_rc "$HOME/.bashrc"
add_to_rc "$HOME/.zshrc"

############################
# Cleanup repo
############################
echo "[*] Cleaning up repo..."

cd "$HOME"
rm -rf "$REPO_ROOT"

############################
# Done
############################
echo ""
echo "[✓] Setup complete"
echo "→ Open a new terminal"
echo "→ tmux will auto-start"
echo "→ Inside tmux: press prefix + I to install plugins"
