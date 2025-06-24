source ~/git/linux-bash-tools/libs/error-handling.shlib
# get termite color schemes
echo "cloning termite color schemes"
if [[ -d ~/temp/nerd-fonts-complete-ubuntu ]]
then
  cd ~/temp/nerd-fonts-complete-ubuntu
  git pull
else
  git clone https://github.com/ryanoasis/nerd-fonts.git ~/temp/nerd-fonts-complete-ubuntu

  # arch
  # https://aur.archlinux.org/nerd-fonts-complete.git ~/temp/nerd-fonts-complete-arch
fi

cd ~/temp/nerd-fonts-complete-ubuntu
# ubuntu instructions
bash install.sh VictorMono
bash install.sh JetBrainsMonoExtraBold
# arch instructions
# makepkg -f
# ls *.pkg.tar.zst | xargs sudo packman -U --noconfim



mkdir -p ~/.config/alacritty
ln -s ~/git/linux-config/config-files/local/alacritty.yml ~/.config/alacritty/alacritty.yml


# other green color options:
# b1be2c, a8b14c, b7c42d

