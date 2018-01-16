export ZSH=~/.oh-my-zsh

ZSH_THEME="robbyrussell"

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git tmux vi-mode sudo nmap docker httpie)

ZSH_TMUX_AUTOSTART="true"
ZSH_TMUX_AUTOQUIT="false"

source $ZSH/oh-my-zsh.sh

export EDITOR="vim"

export SSH_KEY_PATH="~/.ssh/rsa_id"

DEFAULT_USER="$(whoami)"

# for vim clipboard
export DISPLAY=:0

export PATH=$PATH:$HOME/bin

if [[ -z "$GOPATH" ]]; then
    export GOPATH=$HOME/go
    export GOROOT=/usr/lib/go
    export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi

[ -x "$(which vim)" ] && alias vi=$(which vim)
[ -x "$(which nvim)" ] && alias vim=$(which nvim)
[ -x "$(which kubectl)" ] && source <(kubectl completion zsh)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


export PATH=$PATH:/home/jpang/bin

source '/home/jpang/lib/azure-cli/az.completion'
