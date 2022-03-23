# error out if there is an error in the script
trap_msg='s=${?}; echo "${0}: Error on line "${LINENO}": ${BASH_COMMAND}"; exit ${s}'
set -uo pipefail
trap "${trap_msg}" ERR

# create temp folder
mkdir -p ~/install-temp

mkdir -p ~/git
echo "installing git"
sudo apt-get install -y git

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

#echo "disabling mouse acceleration"
#sudo cp ~/git/linux-config/config-files/local/no-mouse-acceleration.conf /etc/X11/xorg.conf.d/no-mouse-acceleration.conf

echo "installing dependencies and utilities"
bash ~/git/linux-config/sub-scripts/install-software-ubuntu.sh

echo "copying files"
echo "  copying inputrc"
if [ -f ~/.inputrc ]; then rm ~/.inputrc; fi
ln -s ~/git/linux-config/config-files/local/inputrc ~/.inputrc

echo "  copying bashrc"
if [ -f ~/.bashrc ]; then rm ~/.bashrc; fi
ln -s ~/git/linux-config/config-files/local/bashrc ~/.bashrc

#source bashrc so rest of config can use it
source ~/.bashrc

mkdir -p ~/.config/nvim
echo "  copying nvim config (nvim read vimrc)"
if [ -f ~/.config/nvim/init.vim ]; then rm ~/.config/nvim/init.vim; fi
ln -s ~/git/linux-config/config-files/local/nvim-init ~/.config/nvim/init.vim

# installing neovim plugins
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim -s $HOME/git/linux-config/sub-scripts/neovimCommands

# install language servers
# bash ~/git/linux-config/sub-scripts/nvim-language-servers-install.sh

# install jetbrains products
bash ~/git/linux-config/sub-scripts/setup-jetbrains-tools.sh

# install fonts setup
mkdir -p ~/.fonts

echo "configuring alacritty"
mkdir -p ~/.config/alacritty
if [ -f ~/.config/alacritty/alacritty.yml ]; then rm ~/.config/alacritty/alacritty.yml; fi
ln -s ~/git/linux-config/config-files/local/alacritty.yml ~/.config/alacritty/alacritty.yml


echo "installing gnupg"
bash ~/git/linux-config/sub-scripts/gnupg-setup.sh

# new ssh connections script
echo "copying file for new ssh connections to home directory"
if [ -f ~/newSSHConnection.sh ]; then rm ~/newSSHConnection.sh; fi
ln -s ~/git/linux-config/utility-scripts/newSSHConnection.sh $HOME/newSSHConnection.sh

# add new commands to running terminal
source ~/.bashrc

echo "cant source .inputrc for some reason that breaks things. To apply .inputrc logout and login again"

# mlocate database cronjob
