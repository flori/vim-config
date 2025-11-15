#!/usr/bin/env bash

set -e
echo -n "Updating pathogen.vim… "
curl -LSso home/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
echo Done.
git submodule init
git submodule update
for plugin in home/.vim/bundle/*/
do
  pushd "$plugin" >/dev/null || continue
  echo "Pulling $plugin"
  head="$(git remote show origin | awk '/HEAD branch:/ { print $3 }')"
  git checkout "$head"
  git pull
  popd >/dev/null || continue
done
