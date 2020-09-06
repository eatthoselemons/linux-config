source ~/git/linux-bash-tools/libs/error-handling.shlib
infocmp > termite.terminfo
scp termite.terminfo \$1:
ssh \$1 'tic -x termite.terminfo'
