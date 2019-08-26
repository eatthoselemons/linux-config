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


# Configuration

Clone this repository into your $HOME folder so that you end up with $HOME/linux-config

`git clone https://github.com/eatthoselemons/linux-config ~/.`

add this to your `.bashrc`:

``` shell
if [ -f $HOME/linux-config/extra-bash ]; then
	. $HOME/linux-config/extra-bash
fi
```

inside vim run 
```
:call mkdir(stdpath('config'), 'p')
:exe 'edit '.stdpath('config').'/init.vim'
```

then in that paste:

```
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/linux-config/vimrc
```


