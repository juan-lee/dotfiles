export ZSH="$HOME/.oh-my-zsh"
[ -x "/opt/homebrew/bin/brew" ] && eval $(/opt/homebrew/bin/brew shellenv)

ZSH_THEME="robbyrussell"
ZSH_TMUX_AUTOSTART="true"
ZSH_TMUX_AUTOQUIT="false"
COMPLETION_WAITING_DOTS="true"

plugins=(git tmux vi-mode nmap colored-man-pages golang kubectl kubectx dotenv)

source $ZSH/oh-my-zsh.sh

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,exports,aliases,functions,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# base16
[ -f "${XDG_CONFIG_HOME}/base16-shell/base16-shell.plugin.zsh" ] && source "${XDG_CONFIG_HOME}/base16-shell/base16-shell.plugin.zsh"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ -x "$(which highlight)" ]; then
    export FZF_CTRL_T_OPTS="--no-height --no-reverse --select-1 --exit-0 --preview '(highlight -O ansi {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
    export FZF_ALT_C_OPTS="--no-height --no-reverse --preview 'tree -C {} | head -200'"
else
    export FZF_CTRL_T_OPTS="--select-1 --exit-0"
fi

export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
