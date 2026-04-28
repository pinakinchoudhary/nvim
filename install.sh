#!/usr/bin/env bash
set -euo pipefail

# --- Resolve repo root robustly (works from anywhere) ---
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

NVIM_CONFIG="$HOME/.config/nvim"
TMUX_CONFIG="$HOME/.tmux.conf"

echo "[*] Repo root: $REPO_ROOT"

# --- Detect OS ---
OS="unknown"
if [[ "$OSTYPE" == "darwin"* ]]; then
  OS="mac"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  OS="linux"
fi

echo "[*] Detected OS: $OS"

# --- Install dependencies ---
echo "[*] Installing dependencies..."

if [[ "$OS" == "mac" ]]; then
  if ! command -v brew >/dev/null 2>&1; then
    echo "[!] Homebrew not found. Install it first: https://brew.sh"
    exit 1
  fi

  brew list neovim >/dev/null 2>&1 || brew install neovim
  brew list tmux >/dev/null 2>&1 || brew install tmux

elif [[ "$OS" == "linux" ]]; then
  # --- Prefer Snap for latest Neovim ---
  if command -v snap >/dev/null 2>&1; then
    echo "[*] Installing Neovim via snap (latest)..."
    sudo snap install nvim --classic || echo "[!] Snap install failed, will fallback"
  else
    echo "[!] snap not found, falling back to package manager"
  fi

  # --- Install tmux + rsync via package manager ---
  if command -v apt >/dev/null 2>&1; then
    sudo apt update
    sudo apt install -y tmux rsync

    # Only install neovim via apt if snap failed AND nvim not present
    if ! command -v nvim >/dev/null 2>&1; then
      echo "[!] Installing Neovim via apt (may be outdated)"
      sudo apt install -y neovim
    fi

  elif command -v dnf >/dev/null 2>&1; then
    sudo dnf install -y tmux rsync neovim

  elif command -v pacman >/dev/null 2>&1; then
    sudo pacman -Sy --noconfirm tmux rsync neovim

  else
    echo "[!] Unsupported package manager. Install dependencies manually."
  fi
fi

# --- Install Neovim config ---
echo "[*] Setting up Neovim..."

mkdir -p "$NVIM_CONFIG"

rsync -av \
  --exclude='.git' \
  --exclude='.github' \
  --exclude='*.md' \
  --exclude='install.sh' \
  "$REPO_ROOT/" "$NVIM_CONFIG/"

echo "[+] Neovim config installed"

# --- Install tmux config (if present) ---
echo "[*] Setting up tmux..."

if [[ -f "$REPO_ROOT/.tmux.conf" ]]; then
  cp "$REPO_ROOT/.tmux.conf" "$TMUX_CONFIG"
  echo "[+] tmux config copied"
else
  echo "[!] No .tmux.conf found, skipping"
fi

# --- Configure auto-start tmux (safe append) ---
add_line_if_missing() {
  local file="$1"
  local line="$2"

  if [[ -f "$file" ]] && ! grep -Fxq "$line" "$file"; then
    echo "$line" >> "$file"
    echo "[+] Updated $file"
  fi
}

echo "[*] Configuring shell auto-start for tmux..."

TMUX_AUTO='if [[ $- == *i* ]] && command -v tmux >/dev/null && [ -z "$TMUX" ]; then tmux attach-session -t main 2>/dev/null || tmux new-session -s main; fi'

add_line_if_missing "$HOME/.bashrc" "$TMUX_AUTO"
add_line_if_missing "$HOME/.zshrc" "$TMUX_AUTO"

# --- Cleanup repo ---
echo "[*] Cleaning up repo..."

cd "$HOME"
rm -rf "$REPO_ROOT"

echo ""
echo "[✓] Setup complete"
echo "→ Open a new terminal"
echo "→ tmux will auto-start"
echo "→ Inside tmux: prefix + I to install plugins"
