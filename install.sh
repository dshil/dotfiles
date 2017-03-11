ln -s -f $(pwd)/.vim/vimrc ~/.vimrc
ln -s -f $(pwd)/.irbrc ~/.irbrc
ln -s -f $(pwd)/.gitconfig ~/.gitconfig
ln -s -f $(pwd)/.vim ~/.vim

gem install interactive_editor

git submodule init
git submodule update
