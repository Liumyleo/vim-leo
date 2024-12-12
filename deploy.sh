#!/bin/bash

#Optional: Uninstall Spacevim
#curl -sLf https://spacevim.org/install.sh | bash -s -- --uninstall

# Uninstall Vim installed
sudo apt-get remove \
	--purge -yq --no-install-recommends \
        vim \
        vim-runtime \
        vim-tiny \
        vim-gnome \
        vim-gui-common \
        vim-common \
        vim-scripts \
        vim-doc
sudo rm -rf /usr/local/share/vim /usr/local/bin/vim /usr/bin/vim ~/.vim ~/.vimrc

# Install Deps
sudo apt-get install build-essential cmake libncurses-dev
sudo apt-get install python3-dev universal-ctags

git clone https://github.com/vim/vim.git

# In case Vim was already installed
cd vim
make distclean && make clean
cd src
make distclean && make clean
cd ..

./configure \
	--disable-pythoninterp \
        --enable-python3interp=yes \
        --with-features huge \
        --with-python3-command=$(sudo which python3) \
        --with-python3-config-dir=$($(sudo which python3)-config --configdir)

make && sudo make install
cd ..

# Custom Vim
git clone https://github.com/Liumyleo/vim-leo.git

cp ./vim-leo/vimrc ~/.vimrc
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe/
bash ./install.sh

sudo apt-get install silversearcher-ag

cd -
rm -rf ./vim ./vim-leo
