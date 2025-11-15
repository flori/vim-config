#!/usr/bin/env bash

url=$1
test -z "$url" && exit 1
target_dir="home/.vim/bundle/$(basename "$url")"
if [ -e "$target_dir" ]
then
  echo >&2 "$target_dir already exists!"
  exit 1
fi
git submodule add --force "$url" "$target_dir"
