#/bin/bash
# git clone git@github.com:tjws052009/dotfiles.git ~/.dotfiles 
git clone https://github.com/tjws052009/dotfiles.git ~/.dotfiles
ln -s ~/.dotfiles/zshrc .zshrc
ln -s ~/.dotfiles/vimrc .vimrc
ln -s ~/.dotfiles/tmux.conf .tmux.conf
ln -s ~/.dotfiles/sreenrc .screenrc

# install brew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew update
brew install rbenv ruby-build

# installing ruby
rbenv install 2.1.1
rbenv rehash

rbenv global 2.1.1

# run brewfile
pushd ~/.dotfiles
brew bundle
popd

chsh -s /bin/zsh

# install vim bundle
# vim -c "BundleInstall|q"
