#!/bin/bash

git submodule init
git submodule update
ln -sf `pwd`/.vimrc $HOME/.vimrc
ln -sf `pwd`/.vim $HOME/.vim
git clean -fdx
