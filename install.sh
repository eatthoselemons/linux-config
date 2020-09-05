# disable mouse acceleration
# error out if there is an error in the script
trap_msg='s=${?}; echo "${0}: Error on line "${LINENO}": ${BASH_COMMAND}"; exit ${s}'
set -uo pipefail
trap "${trap_msg}" ERR


echo "disabling mouse acceleration"
sudo bash -c 'cat << EOF > /etc/X11/xorg.conf.d/no-mouse-acceleration.conf
Section "InputClass"
  Identifier "MyMouse"
  MatchIsPointer "yes"
  # set the following to 1 1 0 respectively to disable acceleration
  Option "AccelerationNumerator" "1"
  Option "AccelerationDenominator" "1"
  Option "AccelerationThreshold" "0"
EndSection
EOF'

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

echo "installing dependencies and utilities"
bash ~/git/linux-config/install-software.sh


echo "copying inputrc"
cp ~/git/linux-config/inputrc ~/.inputrc

echo "copying nvim config (nvim read vimrc)"
cp ~/git/linux-config/nvim-init ~/.config/nvim/init.vim

# installing neovim plugins
nvim -s $HOME/git/linux-config/neovimCommands

echo "copying bashrc"
cp ~/git/linux-config/bashrc ~/.bashrc

# add new commands to running terminal
source .bashrc
source .inputrc

bash ~/git/linux-config/termite-configuration.sh

# mlocate database cronjob
