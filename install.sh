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
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/popstas/zsh-command-time.git ~/.oh-my-zsh/custom/plugins/command-time
wget -c  https://raw.githubusercontent.com/sergeygalkin/termux/master/.zshrc
exit

