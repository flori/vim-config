#!/bin/bash

git submodule init
git submodule update
git clean -fdx
ln -sf "$(pwd)/.vimrc" "$HOME/.vimrc"
ln -snf "$(pwd)/.vim" "$HOME/.vim"
ln -snf "$(pwd)/vim-plugins" "$HOME/.vim/bundle"
