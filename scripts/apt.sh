# Linux - basic prerequisites
set -e

sudo apt-get update

sudo apt-get install -y \
  git \
  curl \
  tmux \
  autojump \
  silversearcher-ag \
  jq \
  tig \
  htop \
  tree \
  xclip \
  sl \
  redshift \
  cmatrix \
  wget \
  telnet \
  zsh \
  pwgen \
  net-tools \
  virtualbox \
  gnome-tweak-tool \
  vlc \
  build-essential\
      autoconf\
      automake\
      cmake\
      libtool\
  docker-engine\
  inotify-tools\
  jq\
  shellcheck \
  mosh \
  ctags \
  neovim

# Git config
wget -O ~/.gitconfig https://raw.githubusercontent.com/tasdikrahman/dotfiles/master/gitconfig

# Generate SSH keys
file="~/.ssh/id_rsa"
if ! [ -f "$file" ]; then
  echo "$file not found."
  ssh-keygen -t rsa -b 4096 -C "tasdik95@gmail.com"
  ssh-add ~/.ssh/id_rsa
fi


# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
wget -O ~/.zshrc https://raw.githubusercontent.com/tasdikrahman/dotfiles/master/zshrc

# change default shell to zsh
chsh -s `which zsh`

# Install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
wget https://raw.githubusercontent.com/tasdikrahman/dotfiles/master/vim/vimrc --output-document=~/.vimrc
vim +PluginInstall +qall

# Install zsh-plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/paulirish/git-open.git $ZSH_CUSTOM/plugins/git-open
