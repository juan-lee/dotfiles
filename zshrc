source ~/.config/base16-shell/base16-shell.plugin.zsh

export ZSH=~/.oh-my-zsh

ZSH_THEME="robbyrussell"

COMPLETION_WAITING_DOTS="true"

plugins=(git tmux vi-mode sudo nmap docker httpie archlinux)

ZSH_TMUX_AUTOSTART="true"
ZSH_TMUX_AUTOQUIT="false"

source $ZSH/oh-my-zsh.sh

export EDITOR="vim"

export SSH_KEY_PATH="~/.ssh/rsa_id"

DEFAULT_USER="$(whoami)"

# for vim clipboard
export DISPLAY=:0

export PATH=$PATH:$HOME/bin

export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

[ -x "$(which vim)" ] && alias vi=$(which vim)
[ -x "$(which nvim)" ] && alias vim=$(which nvim)
[ -x "$(which kubectl)" ] && source <(kubectl completion zsh)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


export PATH=$PATH:/home/jpang/bin
[ -f '~/lib/azure-cli/az.completion' ] && source '~/lib/azure-cli/az.completion'

source ~/.alias

