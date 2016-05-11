## dotfiles

@tasdikrahman does **dotfiles**

**Warning:** 

 If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you don’t want or need. Don’t blindly use my settings unless you know what that entails. **Use at your own risk!**

I am using [rcm](https://github.com/thoughtbot/rcm) and [git](https://git-scm.com) to manage  my `~/.dotfiles` and keep them in sync.

Here's what my `gnome-terminal` looks like

![gnome-terminal-imgur-link](http://i.imgur.com/KfQ59v6.jpg)

As for `vim`. This is what my vim looks like

![vim runtime](http://i.imgur.com/Zc6qvql.png)

Looks good right? I know :smile:

Happy coding!

## Contents

```sh
tasdik at Acer in ~/.dotfiles on master
$ tree -L 2
.
├── aliases
├── bash_profile
├── bash_prompt
├── bashrc
├── curlrc
├── exports
├── functions
├── gemrc
├── gitconfig
├── install.sh
├── nanorc
├── path
├── pythonrc
├── rcrc
├── README.md
├── selected_editor
├── sqliterc
├── tmux.conf
├── vim
│   └── bundle
├── vimrc
├── vimrc.before
└── vimrc.bundles

2 directories, 21 files

```

## Install

**NOTE**: This process assumes that you don't have any existing `rc` files in your `~/.dotfiles` directory. If it exists, take a backup of it.

```sh
$ bash <(curl -s https://raw.githubusercontent.com/prodicus/dotfiles/master/install.sh)
```

This will get you up and running with my dotfiles. Enjoy!

## Notes

- I am using the awesome [spf13 extensions](http://vim.spf13.com/) for my vim configurations. 

You can the color schemes to 

- ir_black
- molokai
- peaksea

To change the color scheme to `molokai`,

```sh
:color molokai
```

will do the magic.

## Related articles

- [http://thoughtbot.github.io/rcm/rcm.7.html](http://thoughtbot.github.io/rcm/rcm.7.html)
- [https://robots.thoughtbot.com/rcm-for-rc-files-in-dotfiles-repos](https://robots.thoughtbot.com/rcm-for-rc-files-in-dotfiles-repos)
- [http://blog.jez.io/2015/03/09/getting-started-with-rcm/](http://blog.jez.io/2015/03/09/getting-started-with-rcm/)
- [https://github.com/thoughtbot/rcm](https://github.com/thoughtbot/rcm)

## Influences

My dotfiles are heavily influenced by 

- [https://github.com/mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
- [https://github.com/jez/dotfiles/](https://github.com/jez/dotfiles/)
- [https://github.com/padde/dotfiles](https://github.com/padde/dotfiles)

## Issues

You can tweet to me at [@tasdikrahman](https://twitter.com/tasdikrahman) if you had any problems installing these dotfiles. 

You can also create an [issue](https://github.com/prodicus/dotfiles/issues)

## Legal stuff

Used and maintained by [Tasdik Rahman](http://tasdikrahman.me) [(@tasdikrahman)](https://twitter.com/tasdikrahman) MIT Licensed [http://prodicus.mit-license.org/](http://prodicus.mit-license.org/)

