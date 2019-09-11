#!/bin/bash
set -xe
apt update
apt upgrade -y
apt install -y vim openssh zsh git vim
curl -O https://github.com/sergeygalkin.keys
mv sergeygalkin.keys > .ssh/authorized_keys
if [ ! -d .oh-my-zsh ]; then  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"; fi
termux-setup-storage
chsh -s zsh
OZSH_CUST_PLUG='.oh-my-zsh/custom/plugins'
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${OZSH_CUST_PLUG}/zsh-autosuggestions || (cd ${OZSH_CUST_PLUG}/zsh-autosuggestions; git pull)
git clone https://github.com/popstas/zsh-command-time.git ${OZSH_CUST_PLUG}/command-time || (cd ${OZSH_CUSTOM_PLUG}/command-time; git pull)
wget -c  https://raw.githubusercontent.com/sergeygalkin/termux/master/.zshrc
exit

