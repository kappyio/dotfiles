#!/bin/sh
# wget -O- https://raw.githubusercontent.com/kappyio/dotfiles/master/ansible/setup.sh | sh

GIT_DIR=dotfiles/ansible

sudo apt-get install -y git python-pip python-dev
sudo pip install ansible

if [ ! -d "$GIT_DIR" ]; then
    git clone https://github.com/kappyio/dotfiles.git
    cd $GIT_DIR
    ansible-playbook install.yml --become -K -c local -i "localhost,"
else
    cd $GIT_DIR
    git pull
    ansible-playbook install.yml --become -K -c local -i "localhost,"
fi

# Install oh-my-zsh
zsh() {
    if hash zsh 2>/dev/null; then
        echo "z shell found"
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    else
        echo "z shell not found"
    fi
}

zsh
