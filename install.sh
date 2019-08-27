#!/bin/bash
apt update
apt upgrade -y
apt install vim openssh zsh git vim
curl -O https://github.com/sergeygalkin.keys
cat sergeygalkin.keys >> .ssh/authorized_keys
if [ ! -d .oh-my-zsh ]; do  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"; done
termux-setup-storage

