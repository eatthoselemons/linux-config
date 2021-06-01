source ~/git/linux-bash-tools/libs/error-handling.shlib

# create file structure
mkdir ~/programs/language-servers/
cd ~/programs/language-servers
mkdir ~/programs/language-servers/executables

# install language servers

#kotlin
mkdir kotlin
cd kotlin
wget https://github.com/fwcd/kotlin-language-server/releases/download/1.1.1/server.zip
ex server.zip
cp server/bin/kotlin-language-server ~/programs/language-servers/executables/

