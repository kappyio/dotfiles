#!/bin/sh
# wget -O- https://raw.githubusercontent.com/kappyio/dotfiles/master/ansible/setup.sh | sh
sudo apt-get install -y git python-pip python-dev
sudo pip install ansible
git clone https://github.com/kappyio/dotfiles.git
cd dotfiles/ansible
ansible-playbook install.yml --become -K -c local -i "localhost,"
