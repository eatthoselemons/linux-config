# disable mouse acceleration
# error out if there is an error in the script
trap_msg='s=${?}; echo "${0}: Error on line "${LINENO}": ${BASH_COMMAND}"; exit ${s}'
set -uo pipefail
trap "${trap_msg}" ERR

# create temp folder
mkdir ~/install-temp

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

echo "cloning or updating linux-bash-tools"
if [[ -d $HOME/git/linux-bash-tools ]];
then
  cd $HOME/git/linux-bash-tools
  git pull
  cd $HOME
else
  git clone https://github.com/eatthoselemons/linux-bash-tools ~/git/linux-bash-tools
fi

echo "disabling mouse acceleration"
sudo cp ~/git/linux-config/config-files/local/no-mouse-acceleration.conf /etc/X11/xorg.conf.d/no-mouse-acceleration.conf

echo "installing dependencies and utilities"
bash ~/git/linux-config/sub-scripts/install-software.sh

echo "copying files"
echo "  copying inputrc"
cp ~/git/linux-config/config-files/local/inputrc ~/.inputrc

echo "  copying bashrc"
cp ~/git/linux-config/config-files/local/bashrc ~/.bashrc

#source bashrc so rest of config can use it
souce ~/.bashrc

mkdir -p ~/.config/nvim
echo "  copying nvim config (nvim read vimrc)"
cp ~/git/linux-config/config-files/local/nvim-init ~/.config/nvim/init.vim

# grab nvim nightly, put in temp folder, and add to path folder
cd ~/install-temp
wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz 
ex nvim-linux64.tar.gz
cp nvim-linux64/bin/nvim /usr/local/bin/nvim-nightly

# installing neovim plugins
nvim -s $HOME/git/linux-config/sub-scripts/neovimCommands

# install language servers
bash ~/git/linux-config/sub-scripts/nvim-language-servers-install.sh

# install intellij
mkdir ~/programs/jetbrains
cd ~/programs/jetbrains
#install toolbox
wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.20.8352.tar.gz
ex jetbrains-toolbox-1.20.8352.tar.gz
cp jetbrains-toolbox-1.20.8352/jetbrains-toolbox /usr/local/bin/

# install fonts setup
mkdir ~/.fonts

# install jetbrains nerd-fonts
curl https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip -o ~/install-temp/
mkdir ~/.fonts/jetbrainsmono/
mv ~/install-temp/JetBrainsMono.zip ~/.fonts/jetbrainsmono/
cd ~/.fonts/jetbrainsmono
ex JetBrainsMono.zip


echo "configuring termite"
bash ~/git/linux-config/sub-scripts/alacritty-configuration.sh

echo "installing gnupg"
bash ~/git/linux-config/sub-scripts/gnupg-setup.sh

# add new commands to running terminal
source .bashrc

echo "cant source .inputrc for some reason that breaks things. To apply .inputrc logout and login again"

# mlocate database cronjob
