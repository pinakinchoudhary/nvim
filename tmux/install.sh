#!/usr/bin/env sh
set -eu

REPO_ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
TMUX_CONF_SOURCE="$REPO_ROOT/tmux/tmux.conf"
TMUX_CONF_TARGET="$HOME/.tmux.conf"
TPM_DIR="$HOME/.tmux/plugins/tpm"

mkdir -p "$HOME/.tmux/plugins"

if [ ! -d "$TPM_DIR" ]; then
  git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
fi

ln -snf "$TMUX_CONF_SOURCE" "$TMUX_CONF_TARGET"

chmod +x "$REPO_ROOT/tmux/bin/clear"
printf '%s\n' "Shell wrappers: tmux/zsh/.zshrc and tmux/bash/bashrc (override 'clear' without wiping scrollback)"

printf '%s\n' "Linked $TMUX_CONF_TARGET -> $TMUX_CONF_SOURCE"
printf '%s\n' "Start tmux, then press prefix + I to install plugins."
