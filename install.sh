ln -s -f $(pwd)/.vim ~/.config/nvim
ln -s -f $(pwd)/.vim/vimrc ~/.config/nvim/init.vim
ln -s -f $(pwd)/.irbrc ~/.irbrc
ln -s -f $(pwd)/.gitconfig ~/.gitconfig

rm $(pwd)/.vim/.vim 2>/dev/null

git submodule init
git submodule update

# Don't forget to exec :Helptags
vim -u NONE -c "helptags vim-fugitive/doc" -c q
