source ~/git/linux-bash-tools/libs/error-handling.shlib
infocmp > termite.terminfo
ssh-keygen -N "" -t rsa -b 2048 -f $HOME/.ssh/terminfo-temp-id
ssh-copy-id -i $HOME/.ssh/terminfo-temp-id $1

scp -i $HOME/.ssh/terminfo-temp-id termite.terminfo $1:
#scp -i $HOME/.ssh/terminfo-temp-id vim-setup.sh $1:
ssh -i $HOME/.ssh/terminfo-temp-id $1 'tic -x termite.terminfo'
#ssh -i $HOME/.ssh/terminfo-temp-id $1 'bash vim-setup.sh'
