#!/bin/bash

DOTFILES=$(dirname $0)

echo $DOTFILES


#setup nvim
ln -sf "$DOTFILES"/nvim/init.vim "$HOME"/.config/nvim/init.vim