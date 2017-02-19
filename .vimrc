" ############################ HELPER FUNCTIONS #############################

" Disable the following keys.
fun! DisableKeys()
    noremap <Up> <Nop>
    noremap <Down> <Nop>
    noremap <Left> <Nop>
    noremap <Right> <Nop>
endfun

" Makes the switching between buffers easy.
fun! SetBufferSwitchKeys()
    map <C-h> <C-w>h
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-l> <C-w>l
endfun

" Executes an input command and saves the current state.
fun! ExecAndSave(cmd)
    " Save the last search.
    let _s=@/

    " Save the cursor position.
    let pos=getpos(".")

    " Exec a command.
    execute a:cmd

    " Restore the search and the cursor position.
    let @/=_s
    call setpos(".", pos)
endfun

" Deletes extra white spaces.
fun! StripTrailingWhiteSpaces()
    call ExecAndSave("%s/\\s\\+$//e")
endfun

" Deletes extra blank lines.
fun! SquashBlankLines()
    call ExecAndSave(":g/^\\_$\\n\\_^$/d")
endfun

" Sets local settings for python files.
fun! SetPythonLocalSettings()
    autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
    autocmd FileType python setlocal colorcolumn=80
endfun

" Sets local settings for C files.
fun! SetCLocalSettings()
    autocmd FileType c setlocal ts=4 sts=4 sw=4 noexpandtab
    autocmd FileType c setlocal colorcolumn=80
endfun

fun! SetupNetrw()
    let g:netrw_liststyle=3 " Use a tree-mode as a default view
    let g:netrw_browse_split=4 " Open a file in a previous buffer
    let g:netrw_preview=1 " A preview window will be shown in a vertically split
    let g:netrw_winsize=20 " A preview file takes 80% and the file explorer - 20%

    nmap <leader>n :e.<CR>
endfun

fun! SetupMisspellings()
    nmap <silent> <leader>s :set spell!<CR>

    " Set a default region to American English
    set spelllang=en_us
endfun

" ############################# SETTINGS ####################################

" Set different indentation for different types of files.
if has("autocmd")
    " Enable file type detection.
    filetype on

    " Apply only for current buffer.
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType ruby,yml setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType go setlocal ts=4 sts=4 sw=4 noexpandtab
 
    call SetPythonLocalSettings()
    call SetCLocalSettings()

    autocmd BufWritePre *.py,*.rb,*.c call StripTrailingWhiteSpaces()
    autocmd BufWritePre *.rb,*.c call SquashBlankLines()
endif

" Symbols for invisible characters (tab, eol).
set list
set listchars=tab:▸\ ,eol:¬

" Default indentation.
" ts stands for tabstop
" sts - for softtabstop (insert mode)
" sw - for shiftwidth (normal mode)
set ts=4 sts=4 sw=4 expandtab

" Default column ruler.
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

set clipboard=unnamed

syntax enable

" Set custom color scheme.
let g:rehash256 = 1
colorscheme molokai

" Show line number.
set number

" Don't show an error during the work with buffers.
set hidden

let mapleader = "," " Set the mapleader.

call SetupMisspellings()
call SetupNetrw()
call DisableKeys()
call SetBufferSwitchKeys()

