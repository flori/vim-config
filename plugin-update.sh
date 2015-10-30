#!/bin/bash

echo -n "Updating pathogen.vim… "
curl -LSso .vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
echo Done.
git submodule init
git submodule update
for plugin in vim-plugins/*/
do
  cd "$plugin"
  echo Pulling $plugin
  git checkout master
  git pull
  cd >/dev/null -
done
