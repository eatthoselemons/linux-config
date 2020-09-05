# install required utilities
echo "installing prerequisite utilities"
sudo pacman -S --noconfirm git vim universal-ctags neovim mlocate

# install display manager
echo "installing xmonad"
sudo pacman -S --noconfirm xmonad xmonad-contrib xterm

# install other useful programs
echo "installing other programs, git, firefox etc"
sudo pacman -S --noconfirm git firefox udisks2 ripgrep pavucontrol gnupg usbutils

# install termite
echo "installing termite terminal emulator"
sudo pacman -S --noconfirm termite
