source ~/git/linux-bash-tools/libs/error-handling.shlib
# get termite color schemes
echo "cloning termite color schemes"
if [[ -d ~/temp/nerd-fonts-complete ]]
then
  cd ~/temp/nerd-fonts-complete
  git pull
else
  git clone https://aur.archlinux.org/nerd-fonts-complete.git ~/temp/nerd-fonts-complete
fi

cd ~/temp/nerd-fonts-complete
makepkg -f
ls *.pkg.tar.zst | xargs sudo pacman -U --noconfirm

mkdir -p ~/.config/alacritty
cp ~/git/linux-config/config-files/local/alacritty.yml ~/.config/alacritty/alacritty.yml


# other green color options:
# b1be2c, a8b14c, b7c42d

echo "copying file for new ssh connections to home directory"
cp ~/git/linux-config/utility-scripts/newSSHConnection.sh $HOME/newSSHConnection.sh
