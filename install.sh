#!/bin/bash

git submodule init
git submodule update
git clean -fdx
ln -sf "$(pwd)/.vimrc" "$HOME/.vimrc"
ln -shf "$(pwd)/.vim" "$HOME/.vim"
ln -shf "$(pwd)/vim-plugins" "$HOME/.vim/bundle"
