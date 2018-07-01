#!/bin/sh
# wget -O- https://raw.githubusercontent.com/vudkapz/dotfiles/master/ansible/setup.sh | sh
sudo apt-get install -y git python-pip python-dev
sudo pip install ansible
git clone https://github.com/vudkapz/dotfiles.git
cd dotfiles
ansible-playbook installation.yml --sudo -K -c local -i "localhost,"
