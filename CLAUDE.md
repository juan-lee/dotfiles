# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a **bare-repo dotfiles** repository following the [Atlassian dotfiles tutorial](https://www.atlassian.com/git/tutorials/dotfiles) pattern. Dotfiles are tracked directly in the repo root and deployed to `$HOME` via a bare git clone at `$HOME/.cfg`. The `config` alias (`git --git-dir=$HOME/.cfg/ --work-tree=$HOME`) is used to manage the working tree. Tool/runtime versions are managed with [asdf](https://asdf-vm.com/).

## Bootstrap

Provision a fresh Ubuntu 24.04 machine:

```bash
DOTFILES_REPO_URL=git@github.com:juan-lee/dotfiles.git ./script/bootstrap
```

The bootstrap script is idempotent and handles: base packages, bare-repo clone + checkout (with conflict backup to `~/.config-backup`), Oh My Zsh, asdf binary install, and `asdf install` from `~/.tool-versions`.

## Key conventions

- **Shell**: zsh with Oh My Zsh (robbyrussell theme).
- **Version manager**: asdf (modern binary install, not git-based). Versions pinned in `.tool-versions`.
- **Dotfiles management**: bare-repo pattern — no symlink manager. Files live at repo root matching their `$HOME` paths.

## Git Practices

- Never include "Generated with Claude Code" or "Co-Authored-By: Claude" lines in commit messages.
