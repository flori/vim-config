#!/bin/bash

target_dir=$1
if [ -z "$target_dir" ]
then
  echo >&2 "Pass the plugin directory to remove!"
  exit 1
fi
if [ ! -e "$target_dir" ]
then
  echo >&2 "$target_dir doesn't exist!"
  exit 1
fi
git submodule deinit --force "$target_dir"
rm -rf "$target_dir"
#./install.sh
