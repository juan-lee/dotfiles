export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)

# asdf: modern setup uses the binary on PATH plus shims on PATH.
export ASDF_DATA_DIR="$HOME/.asdf"
export PATH="$ASDF_DATA_DIR/shims:$PATH"

# Dotfiles bare repo alias
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

source "$ZSH/oh-my-zsh.sh"
