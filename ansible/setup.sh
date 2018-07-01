#!/bin/sh
# wget -O- https://raw.githubusercontent.com/kappyio/dotfiles/master/ansible/setup.sh | sh

GIT_DIR=dotfiles/ansible

sudo apt-get install -y git python-pip python-dev
pip install --user ansible

if [ ! -d "$GIT_DIR" ]; then
    git clone https://github.com/kappyio/dotfiles.git
else
    cd $GIT_DIR
    git pull
    ansible-playbook install.yml --become -K -c local -i "localhost,"
fi

Install oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

