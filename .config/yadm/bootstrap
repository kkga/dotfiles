#!/bin/sh

# Because Git submodule commands cannot operate without a work tree, they must
# be run from within $HOME (assuming this is the root of your dotfiles)
cd "$HOME"

echo "Init submodules"
yadm submodule update --recursive --init
