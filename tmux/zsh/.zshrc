# Sourced by tmux via ZDOTDIR. Load the real zshrc first, then override 'clear'.
ZDOTDIR_ORIG="$ZDOTDIR"
unset ZDOTDIR
[[ -f ~/.zshrc ]] && source ~/.zshrc
export ZDOTDIR="$ZDOTDIR_ORIG"

# Override 'clear' so it never sends \033[3J, preserving tmux scrollback.
alias clear='printf "\033[H\033[2J"'
