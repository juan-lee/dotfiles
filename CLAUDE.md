# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a **bare-repo dotfiles** repository following the [Atlassian dotfiles tutorial](https://www.atlassian.com/git/tutorials/dotfiles) pattern. Dotfiles are tracked directly in the repo root and deployed to `$HOME` via a bare git clone at `$HOME/.cfg`. The `config` alias (`git --git-dir=$HOME/.cfg/ --work-tree=$HOME`) is used to manage the working tree. Tool/runtime versions are managed with [asdf](https://asdf-vm.com/).

## Bootstrap

Provision a fresh macOS (Apple Silicon) or Ubuntu 24.04 machine:

```bash
DOTFILES_REPO_URL=git@github.com:juan-lee/dotfiles.git ./script/bootstrap
source ~/.functions
bare update
```

`script/bootstrap` sets up only the bare dotfiles git repo (clone + checkout with conflict backup to `~/.config-backup`). `bare update` (defined in `.functions`) idempotently installs all dependencies: base packages, Oh My Zsh, asdf binary, tool versions from `.tool-versions`, and sets zsh as login shell.

The `bare` CLI also provides `bare status` to inspect the current state and `bare help` for usage.

## Key conventions

- **Shell**: zsh with Oh My Zsh (robbyrussell theme).
- **Version manager**: asdf (modern binary install, not git-based). Versions pinned in `.tool-versions`.
- **Dotfiles management**: bare-repo pattern — no symlink manager. Files live at repo root matching their `$HOME` paths.

## Git Practices

- Never include "Generated with Claude Code" or "Co-Authored-By: Claude" lines in commit messages.
