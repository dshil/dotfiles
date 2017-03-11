ln -s -f $(pwd)/.vim/vimrc ~/.vimrc
ln -s -f $(pwd)/.irbrc ~/.irbrc
ln -s -f $(pwd)/.gitconfig ~/.gitconfig
ln -s -f $(pwd)/.vim ~/.vim

rm $(pwd)/.vim/.vim 2>/dev/null

gem install interactive_editor

git submodule init
git submodule update
