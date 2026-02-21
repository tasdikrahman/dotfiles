## Install

- vundle by following the guide here for vundle https://github.com/VundleVim/Vundle.vim

#### for mac os x

install the fonts inside the `./fonts` dir and move them to

```
~/Library/Fonts
```

## for any issue with the fonts refer

- install the fonts by following the steps here https://github.com/ryanoasis/vim-devicons/issues/198#issuecomment-338769056

The droid sans fonts can be found here https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/DroidSansMono/complete

#### for linux

```
sudo apt-get install fonts-powerline
```

https://askubuntu.com/questions/393005/having-problem-with-fonts-in-vim-airline

Make nvim use your vim config, add the following to `~/.config/nvim/init.vim`

```
set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
source ~/.vimrc
```

## For coc related installations

- You need node to be above 14.14.

```sh
# check the installation steps if this doesn't work when you are running this again if the version has been bumped off
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - &&\
sudo apt-get install -y nodejs
```

- install yarn
- Run

```
:CocInstall coc-json coc-go coc-snippets
```

```sh
cd ~/.vim/bundle/coc.nvim
yarn install
yarn build
```

## for your coc config

```sh
$ cat ~/.config/nvim/coc-settings.json
{
    "go.goplsOptions": {
      "completeUnimported": true,
      "usePlaceholders": true,
      "analyses": {
        "unusedparams": true,
        "shadow": true,
        "nilness": true,
        "unusedwrite": true
      },
      "staticcheck": true
    },
    "suggest.noselect": true,
    "suggest.enablePreview": true,
    "suggest.floatConfig": {
      "border": true
    },
    "diagnostic.errorSign": "✗",
    "diagnostic.warningSign": "⚠",
    "diagnostic.infoSign": "ℹ",
    "diagnostic.hintSign": "›",
    "diagnostic.virtualText": true,
    "diagnostic.virtualTextCurrentLineOnly": true,
    "hover.autoHide": "true"
}
```

## For gopls

Install gopls with

```sh
go install golang.org/x/tools/gopls@latest
```

make sure `GOBIN` is your path

## For tressitter

Install the helpers for languages

```sh
:TSInstall bash go hcl json make yaml
```
