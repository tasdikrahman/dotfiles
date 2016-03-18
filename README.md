##dotfiles

@tasdikrahman does **dotfiles**

**Warning:** 

 If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you don’t want or need. Don’t blindly use my settings unless you know what that entails. **Use at your own risk!**

I am using [rcm](https://github.com/thoughtbot/rcm) and [git](https://git-scm.com) to manage  my `~/.dotfiles` and keep them in sync.

Here's what my `gnome-terminal` looks like

![gnome-terminal-imgur-link](http://i.imgur.com/KfQ59v6.jpg)

##Contents

```sh
tasdik at Acer in ~/.dotfiles on master
$ tree
      1 .
      2 ├── aliases
      3 ├── bash_profile
      4 ├── bash_prompt
      5 ├── bashrc
      6 ├── exports
      7 ├── functions
      8 ├── gemrc
      9 ├── gitconfig
     10 ├── install.sh
     11 ├── nanorc
     12 ├── path
     13 ├── pythonrc
     14 ├── rcrc
     15 ├── README.md
     16 ├── selected_editor
     17 ├── sqliterc
     18 ├── tmux.conf
     19 └── vimrc
     20 
     21 0 directories, 18 files

```

## Install

- Clone it to your `HOME` directory

```sh
$ cd ~
$ git clone https://github.com/prodicus/dotfiles
```

- Install and configure `git` if you haven't done already.

- run `install.sh`

```sh
$ mv dotfiles/ .dotfiles && cd .dotfiles
$ bash install.sh
```

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

Tweet me [@tasdikrahman](https://twitter.com/tasdikrahman) if you had any problems installing these dotfiles. Well you can create a an [issue too](https://github.com/prodicus/dotfiles/issues)

## Legal stuff

Used and maintained by [Tasdik Rahman](http://tasdikrahman.me) [(@tasdikrahman)](https://twitter.com/tasdikrahman) MIT Licensed [http://prodicus.mit-license.org/](http://prodicus.mit-license.org/)

