#!/usr/bin/env bash

set -e
git submodule init
git submodule update
git clean -fdx
stow -v -t "$HOME" home
