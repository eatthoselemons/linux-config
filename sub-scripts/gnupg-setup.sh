source ~/git/linux-bash-tools/libs/error-handling.shlib
# adding gnupg for gpg-agent to manage ssh keys
function addToBashrc {
cat << 'EOF' >> $HOME/.bashrc

# set gpg-agent as default
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null
EOF
}


if grep -Fxq "gpg-connect-agent updatestartuptty /bye >/dev/null" $HOME/.bashrc
then
  echo "gpg-agent already in bashrc"
else
  addToBashrc
fi

# mlocate database cronjob

# set program for ssh key passphrase entering
# also set the pinentry program to start in the active terminal not the first terminal
mkdir -p $HOME/.gnupg
echo "pinentry-program /usr/bin/pinentry-curses" > $HOME/.gnupg/gpg-agent.conf
mkdir -p $HOME/.ssh
echo 'Match host * exec "gpg-connect-agent UPDATESTARTUPTTY /bye"' >> ~/.ssh/config
