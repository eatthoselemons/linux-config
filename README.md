# linux-config
### Reasoning
My linux config, vim, bash etc started from scratch so didn't feel that updating the last one would make sense

I can't stand the feel of an IDE and the vim plugins for various IDE's just don't work that well and I have yet to find one that supports my favorite keymapping `jk` to `<Esc>` which greatly reduces my hand fatigue and carpal tunnel.

From that I switched exclusively to vim and have found no reason to switch back.

### Philosophy of this configuration

The biggest principal for me is to make programming comfortable, reduceing hand fatigue, moving back and forth from the mouse, switching from terminal to other applications etc.

For missing out on the features of an IDE I strongly belive in the (Unix as an IDE philosophy)[https://sanctum.geek.nz/arabesque/series/unix-as-ide/]

I do however like using vim as much as possible. So if there is a plugin that changes vim and adds terminal features to vim I am up for trying it.

I am not using Tmux or a vim tmux plugin since I prefer using a desktop manager currently messing around with i3


# Install

To have all the features install the latest version of neovim, on Ubuntu or Pop OS! you can the neovim package (repository)[https://launchpad.net/~neovim-ppa/+archive/ubuntu/stable]

`sudo add-apt-repository ppa:neovim-ppa/stable`
`sudo apt-get update`
`sudo apt-get install neovim`

Clone this repository into your $HOME folder so that you end up with $HOME/linux-config

`git clone https://github.com/eatthoselemons/linux-config ~/.`

add this to your `.bashrc`:

``` shell
if [ -f $HOME/linux-config/extra-bash ]; then
	. $HOME/linux-config/extra-bash
fi
```
**Settings will not take effect till you restart your terminal(s)**

inside neovim run 
```
:call mkdir(stdpath('config'), 'p')
:exe 'edit '.stdpath('config').'/init.vim'
```

use `:help nvim` for info or as of Aug 2019 the default for Ubuntu is:
`~/.config/nvim/init.vim`

then in that paste:

```
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/linux-config/vimrc
```

After that run:
`vim` in the terminal and you should be greeted with a loading of the plugins and also an nvim window

This configuration uses (base16)[http://chriskempson.com/projects/base16/] for the colors of both vim and the terminal.

I use the (base16-shell)[https://github.com/chriskempson/base16-shell] as that seems to work with most terminal and is easy to configure, I already have the bash configuration line in `./extra-bash`

To install base16-shell just run:
`git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell`

and then use `base16_[colorscheme]` to change your terminal, I use monokai (run `base16_monokai` in the terminal)


