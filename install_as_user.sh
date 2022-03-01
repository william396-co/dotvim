#!/bin/bash

cd $HOME
mkdir -p bin
echo "Install oh_my_zsh ..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Install tmux ..."
cd $HOME
git clone https://github.com/gpakosz/.tmux.git
ln -s .tmux/.tmux.conf .tmux.conf && cp .tmux/.tmux.conf.local .tmux.conf.local

echo "Clone dotvim ..."
git clone https://github.com/spriteray/dotvim.git
cd dotvim
git submodule update --init --recursive
cp _vimrc ~/.vimrc
cp -r dircolors-solarized ~/.dircolors-solarized
cp _gitconfig ~/.gitconfig
cp _git-commit-template ~/.git-commit-template
cp -r vimfiles ~/.vim
cp pid ~/bin
cp xssh ~/bin
cp findc ~/bin
cp git-diff-wrapper ~/bin
cp agnoster-light.zsh-theme ~/.oh-my-zsh/themes

cd $HOME
mkdir -p .vim/bundle
ln -s /usr/src/YouCompleteMe .vim/bundle/YouCompleteMe
echo "PATH=$PATH:$HOME/bin"
echo "export LESSCHARSET=utf-8" >> .zshrc
echo "export LANG=\"zh_CN.UTF-8\"" >> .zshrc
echo "export LC_ALL=\"zh_CN.UTF-8\"" >> .zshrc
echo "eval \"\`dircolors -b $HOME/.dircolors-solarized/dircolors.ansi-light\`\"" >> .zshrc
echo "alias ls='ls -F --color'" >> .zshrc
echo "alias ll='ls -l'" >> .zshrc
echo "alias la='ls -A'" >> .zshrc
echo "alias tailf='tail -n 300 -f'" >> .zshrc
echo "alias tnew='tmux new -s'" >> .zshrc
echo "alias tattach='tmux attach -t'" >> .zshrc
sed -i "s/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"agnoster-light\"/g" .zshrc

sed -i 's/^# set -gu prefix2/set -gu prefix2/g' .tmux.conf.local
sed -i 's/^# unbind C-a/unbind C-a/g' .tmux.conf.local
sed -i 's/^# unbind C-b/unbind C-x/g' .tmux.conf.local
sed -i 's/^# set -g prefix C-a/set -g prefix C-x/g' .tmux.conf.local
sed -i 's/^# bind C-a send-prefix/bind C-x send-prefix/g' .tmux.conf.local
sed -i 's/^#set -g status-position top/set -g status-position top/g' .tmux.conf.local

vim +PlugInstall +qall
sed -i 's/" colorscheme solarized/colorscheme solarized/g' .vimrc

