# tmux

Portable tmux config for macOS, Linux, local terminals, and SSH sessions.

## Goals

- Keep tmux reproducible: clone repo, run install script, install plugins, done.
- Work well in Ghostty with truecolor and focus reporting.
- Behave reasonably when you SSH from Ghostty into Linux hosts.
- Keep copy-mode simple and vi-like.
- Preserve scrollback — `Ctrl-l` and `clear` never erase history.

## Files

```
tmux/
├── tmux.conf          main tmux config (symlinked to ~/.tmux.conf)
├── install.sh         links config and installs TPM
├── bin/
│   └── clear          scrollback-safe clear wrapper (for PATH use)
├── zsh/
│   └── .zshrc         zsh wrapper: sources real ~/.zshrc, overrides clear/Ctrl-l
└── bash/
    └── bashrc         bash wrapper: sources real ~/.bashrc, overrides clear/Ctrl-l
```

## Install

### macOS

```sh
git clone https://github.com/pinakinchoudhary/setup.nvim.git ~/.config/nvim
sh ~/.config/nvim/tmux/install.sh
tmux
```

Inside tmux, press `Ctrl-a + I` to install TPM plugins.

### Linux (Ubuntu / Debian)

```sh
# Install tmux if needed
sudo apt update && sudo apt install -y tmux

# Optional: clipboard tools for non-OSC52 fallback
# Wayland:
sudo apt install -y wl-clipboard
# X11:
sudo apt install -y xclip

# Clone and install
git clone https://github.com/pinakinchoudhary/setup.nvim.git ~/.config/nvim
sh ~/.config/nvim/tmux/install.sh
tmux
```

Inside tmux, press `Ctrl-a + I` to install TPM plugins.

## Key Bindings

| Key | Action |
|-----|--------|
| `Ctrl-a` | prefix |
| `prefix \|` | split horizontal |
| `prefix -` | split vertical |
| `prefix c` | new window (same path) |
| `prefix r` | reload config |
| `prefix m` | zoom/unzoom pane |
| `Ctrl-h/j/k/l` | navigate panes (vim-tmux-navigator) |
| `Ctrl-l` | clear visible screen, preserve scrollback |

## Copy Mode

| Key | Action |
|-----|--------|
| `prefix [` | enter copy mode |
| `v` | begin selection |
| `V` | select line |
| `Ctrl-v` | rectangle toggle |
| `y` | copy and exit |
| mouse drag | copy and exit |
| trackpad scroll | scroll through history |

## How `clear` / `Ctrl-l` Preserve Scrollback

Standard `clear` sends `\033[3J` which wipes the tmux scrollback buffer.
This config avoids that in two ways:

1. **`Ctrl-l` (tmux binding)**: Detects whether the active pane is running vim/fzf.
   - In vim: passes `Ctrl-l` through for split navigation.
   - In shell: writes `\033[H\033[2J` (visible clear only) directly to the pane TTY,
     then sends `SIGWINCH` to the shell process so readline/zle redraws the prompt.

2. **`clear` command**: Each new pane shell (zsh or bash) is launched via a wrapper
   that sources your real rc file and then aliases `clear` to `printf '\033[H\033[2J'`.
   - zsh: launched with `ZDOTDIR=~/.config/nvim/tmux/zsh`
   - bash: launched with `bash --init-file ~/.config/nvim/tmux/bash/bashrc`

## Clipboard Model

- `set-clipboard on` lets tmux use OSC52 when the terminal supports it.
- `tmux-yank` handles OS-aware clipboard writes:
  - macOS: `pbcopy`
  - Linux Wayland: `wl-copy`
  - Linux X11: `xclip` or `xsel`

OSC52 is the most portable path over SSH — the remote host asks the local
terminal to copy to your local clipboard.

## Session Persistence

`tmux-resurrect` saves and restores sessions. `tmux-continuum` auto-saves every
few minutes and restores on tmux start (`@continuum-restore on`).

## Optional Symlink Strategy

If you split Neovim and tmux into a broader dotfiles repo, move `tmux/` there
and keep the same `install.sh` pattern.
