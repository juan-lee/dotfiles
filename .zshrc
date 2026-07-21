export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
ZSH_TMUX_AUTOSTART="true"
ZSH_TMUX_AUTOQUIT="false"
COMPLETION_WAITING_DOTS="true"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{includes,aliases,functions,path,extra,exports}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

plugins=(direnv dotenv git kubectl tmux vi-mode)

source "$ZSH/oh-my-zsh.sh"
