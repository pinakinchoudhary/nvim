# tmux

Portable tmux config for macOS, Linux, local terminals, and SSH sessions.

## Goals

- Keep tmux reproducible like Neovim: clone repo, link config, install plugins, done.
- Work well in Ghostty with truecolor and focus reporting.
- Behave reasonably when you SSH from Ghostty into Linux hosts.
- Keep copy-mode simple and vi-like.
- Make tmux visually obvious without turning the statusline into noise.

## Files

- `tmux.conf`: main tmux config
- `install.sh`: links `~/.tmux.conf` and installs TPM if missing

## Install

```sh
git clone https://github.com/pinakinchoudhary/setup.nvim.git ~/.config/nvim
cd ~/.config/nvim
sh tmux/install.sh
tmux source-file ~/.tmux.conf
```

Then inside tmux:

```text
prefix + I
```

That installs TPM-managed plugins.

## Clipboard Model

This config is designed to work across machines.

- `set -g set-clipboard on` lets tmux use OSC52 when the terminal supports it.
- `tmux-yank` is configured with OS-aware clipboard commands:
  - macOS: `pbcopy`
  - Linux Wayland: `wl-copy`
  - Linux X11: `xclip` or `xsel`

If you SSH from Ghostty into a Linux host, OSC52 is the most portable path because the remote host can ask the local terminal to copy to your local clipboard.

## Copy Mode

- `prefix + [` enters copy-mode
- `v` starts selection
- `V` selects line
- `Ctrl-v` toggles rectangle selection
- `y` copies and exits
- mouse drag in copy-mode also copies and exits

## Navigation

`vim-tmux-navigator` owns `Ctrl-h/j/k/l`, so pane movement should feel consistent between Neovim and tmux.

## Notes For Linux Hosts

Install one clipboard tool if you want non-OSC52 fallback:

- Wayland: `wl-copy`
- X11: `xclip` or `xsel`

## Optional Symlink Strategy

If you eventually split Neovim and tmux into a broader dotfiles repo, move `tmux/` there and keep the same `install.sh` pattern.
