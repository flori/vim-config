#!/bin/bash

git submodule init
git submodule update
git clean -fdx
ln -sf `pwd`/.vimrc $HOME/.vimrc
ln -sf `pwd`/.vim $HOME/.vim
ln -sf `pwd`/vim-plugins $HOME/.vim/bundle
