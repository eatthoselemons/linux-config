# linux-config

### Script

If you would like a script to perform the install then use `install.sh`

### Reasoning
My linux config, vim, bash etc started from scratch so didn't feel that updating the last one would make sense

I can't stand the feel of an IDE and the vim plugins for various IDE's just don't work that well and I have yet to find one that supports my favorite keymapping `jk` to `<Esc>` which greatly reduces my hand fatigue and carpal tunnel.

From that I switched exclusively to vim and have found no reason to switch back.

### Philosophy of this configuration

The biggest principal for me is to make programming comfortable, reduceing hand fatigue, moving back and forth from the mouse, switching from terminal to other applications etc.

For missing out on the features of an IDE I strongly belive in the [Unix as an IDE philosophy](https://sanctum.geek.nz/arabesque/series/unix-as-ide/ )

I do however like using vim as much as possible. So if there is a plugin that changes vim and adds terminal features to vim I am up for trying it.

I am not using Tmux or a vim tmux plugin since I prefer using a desktop manager currently using xmonad


### Terminal Colors

This configuration uses monokai from [base16](http://chriskempson.com/projects/base16/ ) for the colors of both vim and the terminal.

I have settled on using termite for the terminal. As the best methkd to set the colors of termite and the slight color changes that I have in the termite config. The color setup is done in the `install.sh` script

If you want to mess around with various colorschemes you can use [base16-shell](https://github.com/chriskempson/base16-shell )


Documentation on all of the vim plugins and reasons for choosing [them](https://github.com/eatthoselemons/linux-config/notes/blob/master/vim-plugin-reasoning.md )

### NOTES

The config uses termite as the terminal. Termite however isn't supported on every os by default so you will need to run `bash newSSHConnection.sh` with the server if you want to have the ssh session work correctly (one way this presents itself is that you cannot use backspace or vim doesn't show up right)

usage `bash newSSHConnection <username>@<ip-address>`
example: `bash newSSHConnection user@10.0.0.1`


Thinks to keep in mind:
1. The default config uses termite as the terminal. Termite however isn't supported on every os by default so you will need to run `bash newSSHConnection.sh` with the server if you want to have the ssh session work correctly (one way this presents itself is that you cannot use backspace or vim doesn't show up right) Also note that the `newSSHConnection.sh` script only does it for the user you run it as. If you use another user when you are ssh'ed over termite then you will have the same issues. Run `tix -x termite.terminfo` as the user you are wanting to work.
