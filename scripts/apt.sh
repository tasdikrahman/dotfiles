# Linux - basic prerequisites
sudo apt-get update

sudo apt-get install -y \
  git \
  curl \
  tmux \
  silversearcher-ag \
  jq \
  htop \
  tree \
  xclip \
  sl \
  cmatrix \
  wget \
  telnet

# Git config
wget https://raw.githubusercontent.com/tasdikrahman/dotfiles/master/gitconfig --output-document=~/.gitconfig


# Generate SSH keys
file="~/.ssh/id_rsa"
if ! [ -f "$file" ]; then
  echo "$file not found."
  ssh-keygen -t rsa -b 4096 -C "tasdik95@gmail.com"
  ssh-add ~/.ssh/id_rsa
fi


# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
wget https://raw.githubusercontent.com/tasdikrahman/dotfiles/master/zshrc --output-document=~/.zshrc

# Install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
wget https://raw.githubusercontent.com/tasdikrahman/dotfiles/master/vim/vimrc --output-document=~/.vimrc
vim +PluginInstall +qall

