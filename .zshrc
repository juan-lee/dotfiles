export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# Load the shell dotfiles, and then some:
# * ~/.includes is sourced first, for anything that must load before the rest.
# * ~/.exports is sourced before ~/.path so $PATH can reference exported vars.
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
# NOTE: this loop runs BEFORE oh-my-zsh.sh, so compinit/compdef are not yet
# available here — completions live in ~/.completions (sourced below).
for file in ~/.{includes,aliases,functions,exports,path,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

plugins=(direnv dotenv git kubectl tmux vi-mode)

source "$ZSH/oh-my-zsh.sh"

# Completions & shell integrations that need compinit (loaded by oh-my-zsh.sh above)
[ -r ~/.completions ] && [ -f ~/.completions ] && source ~/.completions
