#!/bin/bash

echo -n "Updating pathogen.vim… "
curl -LSso .vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
echo Done.
git submodule init
git submodule update
for plugin in vim-plugins/*/
do
  pushd "$plugin" >/dev/null || continue
  echo "Pulling $plugin"
  git checkout master
  git pull
  popd >/dev/null || continue
done
