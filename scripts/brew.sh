#!/usr/bin/env bash

# Install Homebrew or make sure it's up to date.
which -s brew
if [[ $? != 0 ]] ; then
	info "Installing"
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
	info "Updating"
	brew update
	brew upgrade
fi

# Disable analytics.
brew analytics off

echo "Installing essentials"

brew install ag
brew install git
brew install git-lfs
brew install gnupg
brew install htop
brew install imagemagick
brew install lcov
brew install libxml2
brew install ncdu
brew install neovim
brew install python
brew install ripgrep
brew install rsync
brew install the_silver_searcher
brew install tig
brew install tmux
brew install tree
brew install unrar
brew install vim
brew install wget --with-iri
brew install mosh
brew install shellcheck
brew install fzf

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install binutils
brew install nmap
brew install tcpflow
brew install tcpreplay
brew install telnet
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.

# Install Ruby related tools
brew install rbenv
brew install rbenv-gem-rehash
brew install rbenv-default-gems
brew install rbenv-gemset

brew install ctags

# Install terraform related tools
brew install tfenv

echo "Linking apps"

brew linkapps

# Remove outdated versions from the cellar.
brew cleanup

# Git config
wget https://raw.githubusercontent.com/tasdikrahman/dotfiles/master/gitconfig --output-document=~/.gitconfig

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
wget https://raw.githubusercontent.com/tasdikrahman/dotfiles/master/zshrc --output-document=~/.zshrc

# change default shell to zsh
chsh -s `which zsh`

# Install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
wget https://raw.githubusercontent.com/tasdikrahman/dotfiles/master/vim/vimrc --output-document=~/.vimrc
vim +PluginInstall +qall

# Install zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install zsh-plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/paulirish/git-open.git $ZSH_CUSTOM/plugins/git-open

# Install plugin requirements
$(brew --prefix)/opt/fzf/install
