## Run this in your $HOME dir

# clone you repo from "https://github.com/prodicus/dotfiles.git" in your home
# directory and then run this script as root

## installing rcm
add-apt-repository ppa:martin-frost/thoughtbot-rcm
apt-get update

## installing dependencies
apt-get install rcm
apt-get install tree
apt-get install cowsay
apt-get install python-pip
apt-get install vim
apt-get install tmux
pip install virtualenv

DOTFILES=~/.dotfiles
if [ -d $DOTFILES ]; then
  echo "$DOTFILES already exists! Aborting."
  exit 1
fi

# cloning the repo
cd ~
git clone https://github.com/prodicus/dotfiles .dotfiles

# Symlink dotfiles
rcup -v 

