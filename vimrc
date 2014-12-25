filetype off                  " required!
filetype plugin indent on     " required!
runtime macros/matchit.vim

" cd
cd /var/www/service

"<Leader> key is ,
let mapleader=","

" Vundle init
set rtp+=~/.vim/bundle/vundle/

" Require Vundle
try
    call vundle#rc()
catch
    echohl Error | echo "Vundle is not installed. Run 'cd ~/.vim/ && git submodule init && git submodule update'" | echohl None
endtry

"{{{ Vundle Bundles!
if exists(':Bundle')
    Bundle 'gmarik/vundle'

    " My Bundles here:
    "
    " repos on github
    Bundle 'Lokaltog/vim-easymotion'
    "Bundle 'kchmck/vim-coffee-script'
    Bundle 'scrooloose/nerdtree.git'
    Bundle 'kien/ctrlp.vim'
    Bundle 'joonty/vim-phpqa.git'
    Bundle 'joonty/vim-sauce.git'
    Bundle 'joonty/vdebug.git'
    Bundle 'joonty/vim-phpunitqf.git'
    "Bundle 'joonty/vim-taggatron.git'
    Bundle "mattn/emmet-vim"
    Bundle 'tpope/vim-fugitive.git'
    Bundle 'tpope/vim-rails.git'
    Bundle 'tpope/vim-markdown.git'
    Bundle 'ervandew/supertab.git'
    Bundle 'scrooloose/syntastic.git'
    Bundle 'joonty/vim-tork.git'
    Bundle 'rking/ag.vim'
    Bundle 'othree/html5.vim.git'
    Bundle 'SirVer/ultisnips.git'
end
"}}}

" Set font for GUI (e.g. GVim)
if has("gui_running")
    set guifont=Liberation\ Mono\ 14
    colorscheme rootwater
endif

"{{{ Key Maps
" Stop that damn ex mode
nnoremap Q <nop>

" omnicomp
inoremap <Leader>o <C-x><C-o>

" call browser
nnoremap <Leader>br :call Browser ()<CR>

" set breakpoint
nnoremap <Leader>v :Breakpoint<CR>

" Quick nohl
nnoremap <Leader>h :nohl<CR>

" CtrlP
nnoremap <Leader>t :CtrlP getcwd()<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>

" execute php
map <Leader>e :!php %<CR>

" edit hex
map <Leader>x :%!xxd -g 1<CR>
map <Leader>xx :%!xxd -r<CR>

" Show hidden characters (spaces, tabs, etc)
nmap <silent> <leader>s :set nolist!<CR>

" PHPDoc commands
inoremap <leader>d <ESC>:call PhpDocSingle()<CR>i
nnoremap <leader>d :call PhpDocSingle()<CR>
vnoremap <leader>d :call PhpDocRange()<CR>

" Fugitive shortcuts
nnoremap <Leader>c :Gcommit -a<CR>i
nnoremap <Leader>g :Git 
nnoremap <Leader>a :Git add %:p<CR>

" Quick insert mode exit
imap jj <Esc>

" Tree of nerd
nnoremap <Leader>n :NERDTreeToggle<CR>
"}}}

"{{{ Plugin Settings
let g:EasyMotion_leader_key = '<Space>'
let g:NERDTreeMapHelp = "h"

let g:ctrlp_working_path_mode = 'ra'

" Tab completion - local
let g:SuperTabDefaultCompletionType = "<c-x><c-p>"

" Vdebug options
let g:vdebug_options = {"on_close":"detach"}

let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_enable_balloons = 1
let g:syntastic_auto_loc_list=1
let g:syntastic_mode_map = { 'mode': 'active',
        \                    'active_filetypes' : [],
        \                    'passive_filetypes' : ['php'] }

let NERDTreeIgnore = ['\.pyc$','\.sock$']

let g:vdebug_features = {'max_depth':3}
"}}}

"Fugitive (Git) in status line
set statusline=%{exists(\"*fugitive#statusline\")?\"branch:\ \".fugitive#statusline():\"\"}\ %F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]

"file encodings
set fileencodings=utf-8,gbk,ucs-born,cp936
" set fold method
set foldmethod=indent
"Spaces, not tabs
set shiftwidth=4
set tabstop=4
set expandtab
" Save a file that requires sudoing even when
" you opened it as a normal user.
command! Sw w !sudo tee % > /dev/null
