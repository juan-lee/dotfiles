source ~/.config/base16-shell/base16-shell.plugin.zsh

export ZSH=~/.oh-my-zsh

ZSH_THEME="robbyrussell"

COMPLETION_WAITING_DOTS="true"

plugins=(git tmux vi-mode sudo nmap docker httpie colored-man-pages zsh-syntax-highlighting vault brew colorize golang kubectl helm kube-ps1)

ZSH_TMUX_AUTOSTART="true"
ZSH_TMUX_AUTOQUIT="false"

source $ZSH/oh-my-zsh.sh

export EDITOR="vim"

export SSH_KEY_PATH="~/.ssh/rsa_id"

DEFAULT_USER="$(whoami)"

[[ -f ~/.profile ]] && . ~/.profile

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/Cellar/terraform/0.11.3/bin/terraform terraform

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
