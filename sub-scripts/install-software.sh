source ~/git/linux-bash-tools/libs/error-handling.shlib
# install required utilities

# check for os type

osType=$(cat /etc/issue)

echo "installing prerequisite utilities"
sudo pacman -S --noconfirm git vim universal-ctags neovim mlocate

# install display manager
echo "installing xmonad"
sudo pacman -S --noconfirm xmonad xmonad-contrib xterm

# install other useful programs
echo "installing other programs, git, firefox etc"
sudo pacman -S --noconfirm git firefox udisks2 ripgrep pavucontrol gnupg usbutils unzip nemo fd jq

# install fonts with Asian typefonts
echo "installing additional typefonts"
sudo pacman -S --noconfirm adobe-source-han-sans-otc-fonts
# install nerd fonts
sudo pacman -S --noconfirm ttf-nerd-fonts-symbols-mono

# install termite
echo "installing termite terminal emulator"
sudo pacman -S --noconfirm termite
