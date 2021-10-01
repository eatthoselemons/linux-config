# linux-config

### Script

If you would like a script to perform the install then use `install.sh`

### Philosophy of this configuration

The biggest principal for me is to make programming comfortable, reduceing hand fatigue, reducing moving back and forth from the mouse, switching from terminal to other applications etc.

To this end vim keybinds are used as much as possible. The keybind for `<ESC>` is `jk` to exit insert mode is used on almost all programs, including the terminal, vim, and jetbrains products

I am not using Tmux or a vim tmux plugin since I prefer using a desktop manager currently using xmonad


### Terminal Colors

This configuration uses monokai from [base16](http://chriskempson.com/projects/base16/ ) for the colors of both vim and the terminal.

I used to use termite as the terminal but have switched to alacritty as it has replaced termite

If you want to mess around with various colorschemes you can use [base16-shell](https://github.com/chriskempson/base16-shell )


Documentation on all of the vim plugins and reasons for choosing [them](https://github.com/eatthoselemons/linux-config/notes/blob/master/vim-plugin-reasoning.md )

### NOTES

The config uses alacritty as the terminal. Alacritty however isn't supported on every os by default so you will need to run `bash newSSHConnection.sh` with the server if you want to have the ssh session work correctly (one way this presents itself is that you cannot use backspace or vim doesn't show up right)

usage `bash newSSHConnection <username>@<ip-address>`
example: `bash newSSHConnection user@10.0.0.1`


Thinks to keep in mind:
1. Note that the `newSSHConnection.sh` script only makes alacritty ssh work for the remote user you run the script as. If you use another user when you are ssh'ed over alacritty then you will have the same issues. Run `tix -x termite.terminfo` as the remote user you are wanting to work as

Tridactyl config:
set interface to work in the center rather than the bottom:
`:colorscheme shydactyl`

This uses gnupg as its ssh agent. If you need to add an ssh key just use the ssh-agent commands as you would with the original ssh-agent.
For example:
`ssh-add ~/.ssh/my_private_key`

### Config Notes
#### mouse
the mouse sensitivity is set via Xorg transformation matrix, use ```````mouse-sensitivity.sh` from [linux-bash-tools](https://github.com/eatthoselemons/linux-bash-tools) to find an sensitivity that works for you then change the first two "1"'s in `no-mouse-acceleration.conf` under "TransformationMatrix" to what you found you liked from the script
