ln -s -f $(pwd)/.vim ~/.config/nvim
ln -s -f $(pwd)/.vim/vimrc ~/.config/nvim/init.vim
ln -s -f $(pwd)/.irbrc ~/.irbrc
ln -s -f $(pwd)/.gitconfig ~/.gitconfig

rm $(pwd)/.vim/.vim 2>/dev/null

# Don't forget to exec :Helptags
vim -u NONE -c "helptags vim-fugitive/doc" -c q

if [[ "$OSTYPE" == "darwin"* ]]; then
    brew install rtags
    brew services restart rtags
fi
