#!/bin/bash
export DEBIAN_FRONTEND=noninteractive ; \
apt-add-repository ppa:fish-shell/release-3 && \
apt-get update -qq && \
apt-get install $(grep -vE "^\s*#" ./pkglist  | tr "\n" " ") -qq ; \
echo "Installing core packages finished, downloading and installing NeoVim." && \
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim ;\
echo "Installing NeoVIM core packages finished, downloading and installing Miniconda 3 and core Python Packages." && \
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/Miniconda3.sh && \
bash ~/Miniconda3.sh -b -p $HOME/Miniconda3 && \
pip install pandas neovim jedi flake8 autopep8 thefuck awscli && \
mkdir ~/.config/nvim/ && mv ./init.vim ~/.config/nvim/init.vim && \
nvim +silent +VimEnter +PlugInstall +qall && \
echo "Success installing all core packages"
