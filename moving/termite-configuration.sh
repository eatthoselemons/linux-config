# get termite color schemes
echo "cloning termite color schemes"
if [[ -d ~/git/base16-termite ]]
then
  git pull
else
  git clone https://github.com/khamer/base16-termite.git
fi

echo "setting up termite"

# move monokai termite theme to the termite config dir
echo "creating termite config dir and moving monokai into that dir"
mkdir -p ~/.config/termite
cp ~/git/base16-termite/themes/base16-monokai.config ~/.config/termite/config

# other green color options:
# b1be2c, a8b14c, b7c42d
# increase default termite size from 9 (default) to 13
echo "increasing default terminal font size"
cat << EOF >> ~/.config/termite/config
[options]
font = Monospace 13
scrollback_lines = 100000
EOF

# replacing the comments with my green color
sed -ri 's:color6\s*=\s*#[a-z0-9]{6}:color6  = #afbc2b:g' ~/.config/termite/config
sed -ri 's:color14\s*=\s*#[a-z0-9]{6}:color14 = #afbc2b:g' ~/.config/termite/config
sed -ri 's:(cursor\s*)=\s*#[a-z0-9]{6}:\1= #939390:g' ~/.config/termite/config
sed -ri 's:(color7\s*)=\s*#[a-z0-9]{6}:\1= #a8a9a6:g' ~/.config/termite/config

echo "copying file for new ssh connections to home directory"
cp ~/git/linux-config/newSSHConnection.sh $HOME/newSSHConnection.sh
