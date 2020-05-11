#!/bin/bash
set -xe
echo "Update packages...."
apt update
apt upgrade -y
echo "Install vim openssh zsh git vim wget gnupg....."
apt install -y vim openssh zsh git vim wget gnupg
echo "Add my keys"
curl -O https://github.com/sergeygalkin.keys
cat sergeygalkin.keys > .ssh/authorized_keys
echo "Install oh-my-zsh...."
if [ ! -d .oh-my-zsh ]; then  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"; fi
echo "Setup access to storage...."
termux-setup-storage
echo "Change shell to zsh......."
chsh -s zsh
echo "Install custom plugins"
OZSH_CUST_PLUG='.oh-my-zsh/custom/plugins'
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${OZSH_CUST_PLUG}/zsh-autosuggestions || (cd ${OZSH_CUST_PLUG}/zsh-autosuggestions; git pull)
git clone https://github.com/popstas/zsh-command-time.git ${OZSH_CUST_PLUG}/command-time || (cd ${OZSH_CUSTOM_PLUG}/command-time; git pull)
curl -O  https://raw.githubusercontent.com/sergeygalkin/termux/master/.zshrc
echo "Setup power font...."
cd .termux
wget https://raw.githubusercontent.com/sergeygalkin/termux/master/.termux/font.ttf
wget https://raw.githubusercontent.com/sergeygalkin/termux/master/.termux/colors.properties
echo "Configure keyboard...."
wget https://raw.githubusercontent.com/sergeygalkin/termux/master/.termux/termux.properties
echo "Reload congiuration...."
termux-reload-settings
exit

