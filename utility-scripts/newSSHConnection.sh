infocmp > termite.terminfo
scp termite.terminfo \$1:
ssh \$1 'tic -x termite.terminfo'
