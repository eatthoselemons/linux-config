trap_msg='s=${?}; echo "${0}: Error on line "${LINENO}": ${BASH_COMMAND}"; exit ${s}'
set -uo pipefail
trap "${trap_msg}" ERR

# install intellij
mkdir -p ~/programs/jetbrains
cd ~/programs/jetbrains
#install toolbox
wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.20.8352.tar.gz
tar -xf jetbrains-toolbox-1.20.8352.tar.gz
sudo cp jetbrains-toolbox-1.20.8352/jetbrains-toolbox /usr/local/bin/

ln -s $HOME/git/linux-config/local/ideavimrc $HOME/.ideavimrc
