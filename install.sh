ln -s -f $(pwd)/.vim/vimrc ~/.vimrc
ln -s -f $(pwd)/.irbrc ~/.irbrc
ln -s -f $(pwd)/.gitconfig ~/.gitconfig
ln -s -f $(pwd)/.vim ~/.vim

rm $(pwd)/.vim/.vim 2>/dev/null

git submodule init
git submodule update

# Don't forget to exec :Helptags
vim -u NONE -c "helptags vim-fugitive/doc" -c q
