source ~/git/linux-bash-tools/libs/error-handling.shlib
# install required utilities

# check for os type

osType=$(cat /etc/issue)

# install base software
sudo apt-get install -y make clang

echo "installing prerequisite utilities"
sudo apt-get install -y git vim universal-ctags neovim plocate curl

# install display manager
echo "installing xmonad"
sudo apt-get install -y xmonad libghc-xmonad-contrib-dev xterm

# install other useful programs
echo "installing other programs, git, firefox etc"
sudo apt-get install -y git firefox udisks2 ripgrep pavucontrol gnupg usbutils unzip nemo jq rsync p7zip

# install fonts with Asian typefonts
echo "installing additional typefonts"
sudo apt-get install -y ttf-wqy-microhei

# install alacritty
echo "installing alacritty terminal emulator"
sudo snap install --classic alacritty
