#!/usr/bin/env bash

set -euo pipefail

if [[ -e "$HOME/.bashrc" ]]; then
  mv "$HOME/.bashrc" "$HOME/.bashrc-old"
fi
if [[ -e "$HOME/.zshrc" ]]; then
  mv "$HOME/.zshrc" "$HOME/.zshrc-old"
fi

cd "./home"
stow \
  -t "$HOME" \
  bin \
  vim \
  git \
  tmux \
  zsh
