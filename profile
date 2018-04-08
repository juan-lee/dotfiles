#!/bin/bash

set -o vi

[[ -f ~/.aliases ]] && . ~/.aliases

[[ -f ~/.exports ]] && . ~/.exports

[[ -f ~/.functions ]] && . ~/.functions

[[ -f ~/.path ]] && . ~/.path

[[ -f ~/.completions ]] && . ~/.completions

[[ -f ~/.extra ]] && . ~/.extra

[[ -f ~/.fzf.zsh ]] && . ~/.fzf.zsh

