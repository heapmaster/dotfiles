#!/bin/bash

# Bashing a curl is naughty, but this is what brew and oh-my-zsh recommend
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

eval "$(/opt/homebrew/bin/brew shellenv)"

brew update
brew bundle
