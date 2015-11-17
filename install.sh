## Run this in $HOME dir

## clone you repo from "https://github.com/prodicus/dotfiles.git" in your home directory and then run this script

DOTFILES=~/.dotfiles
if [ -d $DOTFILES ]; then
  echo "$DOTFILES already exists! Aborting."
  exit 1
fi

# install rcm
sudo -E add-apt-repository ppa:martin-frost/thoughtbot-rcm
sudo apt-get update
sudo apt-get install rcm

# Symlink dotfiles
rcup -v rcrc
rcup -v
# done