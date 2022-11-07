export ZSH="$HOME/.oh-my-zsh"
[ -x "/opt/homebrew/bin/brew" ] && eval $(/opt/homebrew/bin/brew shellenv)

ZSH_THEME="sunrise"
ZSH_TMUX_AUTOSTART="true"
ZSH_TMUX_AUTOQUIT="false"
COMPLETION_WAITING_DOTS="true"

plugins=(base16-shell git tmux vi-mode nmap colored-man-pages golang kubectl kubectx dotenv)

source $ZSH/oh-my-zsh.sh

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{includes,aliases,functions,path,extra,exports}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file
