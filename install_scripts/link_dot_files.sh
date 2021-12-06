#!/bin/bash

function stomp_and_link() {
  local FILE=$1
  if [ -L ~/.$FILE ]; then
    rm ~/.$FILE
  fi
  ln -s $(find $PWD/../ -maxdepth 1 -name $FILE) ~/.$FILE
}

stomp_and_link agignore
stomp_and_link bashrc
stomp_and_link emacs.d
stomp_and_link gitconfig
stomp_and_link screenrc
stomp_and_link vimrc
stomp_and_link zshrc
stomp_and_link zsh_custom.d

mkdir -p ~/.vim
ln -s $(find $PWD/../ -maxdepth 1 -name vim_colors) ~/.vim/colors
