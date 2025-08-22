#!/bin/bash

if ! command -v nvim &>/dev/null; then
  yay -S --noconfirm --needed nvim luarocks tree-sitter-cli

  # Remove prior nvim config
  rm -rf ~/.config/nvim
fi
