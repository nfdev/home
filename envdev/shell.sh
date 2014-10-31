#!/bin/sh

pip install flake8 pyflakes pep8 pylint jedi
mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
