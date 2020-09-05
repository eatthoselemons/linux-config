# disable mouse acceleration
# error out if there is an error in the script
trap_msg='s=${?}; echo "${0}: Error on line "${LINENO}": ${BASH_COMMAND}"; exit ${s}'
set -uo pipefail
trap "${trap_msg}" ERR


mkdir -p ~/git
echo "installing git"
sudo pacman -S --noconfirm git

echo "cloning or updating linux-config"
if [[ -d $HOME/git/linux-config ]];
then
  cd $HOME/git/linux-config
  git pull
  cd $HOME
else
  git clone https://github.com/eatthoselemons/linux-config ~/git/linux-config
fi

echo "disabling mouse acceleration"
sudo cp ~/git/linux-config/config-files/no-mouse-acceleration.conf /etc/X11/xorg.conf.d/no-mouse-acceleration.conf

echo "installing dependencies and utilities"
bash ~/git/linux-config/sub-scripts/install-software.sh

echo "copying files"
echo "  copying inputrc"
cp ~/git/linux-config/config-files/inputrc ~/.inputrc

echo "  copying bashrc"
cp ~/git/linux-config/config-files/bashrc ~/.bashrc

echo "  copying nvim config (nvim read vimrc)"
cp ~/git/linux-config/config-files/nvim-init ~/.config/nvim/init.vim

# installing neovim plugins
nvim -s $HOME/git/linux-config/config-files/neovimCommands

echo "configuring termite"
bash ~/git/linux-config/sub-scripts/termite-configuration.sh

echo "installing gnupg"
bash ~/git/linux-config/sub-scripts/gnupg-setup.sh

# add new commands to running terminal
source .bashrc
source .inputrc

# mlocate database cronjob
