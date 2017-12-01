set nocompatible
filetype off                  " required!

let html_root = "~/xieche-2.0/src/AppBundle"
let garage_root = "~/xieche-2.0/src/Xc/GarageBundle"

" cd
execute "cd ".html_root

"copy to clipboard in mac
set clipboard=unnamed

"<Leader> key is ,
let mapleader=","

" Vundle init
set rtp+=~/.vim/bundle/Vundle.vim/

" Require Vundle
call vundle#begin()

"{{{ Vundle Bundles!
    Plugin 'VundleVim/Vundle.vim'

    " My Bundles here:
    "
    " repos on github
    Plugin 'Jinja'
    Plugin 'Tagbar'
    Plugin 'Lokaltog/vim-easymotion'
    Plugin 'scrooloose/nerdtree.git'
    Plugin 'kien/ctrlp.vim'
    Plugin 'joonty/vim-phpqa.git'
    Plugin 'joonty/vdebug.git'
    Plugin 'joonty/vim-phpunitqf.git'
    Plugin 'mattn/emmet-vim'
    Plugin 'tpope/vim-fugitive.git'
    Plugin 'tpope/vim-rails.git'
    Plugin 'tpope/vim-markdown.git'
    Plugin 'ervandew/supertab.git'
    Plugin 'scrooloose/syntastic.git'
    Plugin 'joonty/vim-tork.git'
    Plugin 'rking/ag.vim'
    Plugin 'othree/html5.vim.git'
    Plugin 'SirVer/ultisnips.git'
    Plugin 'rizzatti/dash.vim'
    "Plugin 'kchmck/vim-coffee-script'
    "Plugin 'joonty/vim-sauce.git'
    "Plugin 'joonty/vim-taggatron.git'
    
call vundle#end()
"}}}

filetype plugin indent on     " required!
runtime macros/matchit.vim

" Set font for GUI (e.g. GVim)
if has("gui_running")
    set guifont=Monaco:h14
endif
syntax enable
colorscheme jc

"{{{ Key Maps
" Stop that damn ex mode
nnoremap Q <nop>

" omnicomp
inoremap <Leader>o <C-x><C-o>

" set breakpoint
nnoremap <Leader>v :Breakpoint<CR>

" Quick nohl
nnoremap <Leader>h :nohl<CR>

" CtrlP
nnoremap <Leader>t :CtrlP getcwd()<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <leader>f :CtrlPTag<cr>

" execute php
map <Leader>e :!php %<CR>
map <Leader>el :.!php %<CR>

" change to current file directory
map <Leader>w :cd %:h<CR>
execute "map <Leader>wr :cd ".html_root."<CR>"
execute "map <Leader>wg :cd ".garage_root."<CR>"
map <Leader>ep :e ../../app/config/parameters.yml<CR>

" phpunit
map <Leader>u :Test 
let g:phpunit_cmd = "/Users/xjz/.composer/vendor/bin/phpunit"
let g:phpunit_args = "-c /Users/xjz/xieche-2.0/app"
let g:phpunit_args_append = "%"

" create tags
map <Leader>. :!ctags -R --languages=php -f ./.git/tags `pwd`<CR>

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
nnoremap <Leader>r :TagbarToggle<CR>
"}}}

"{{{ Plugin Settings
let g:EasyMotion_leader_key = '<Space>'
let g:NERDTreeMapHelp = "h"

"emmet
let g:user_emmet_leader_key = '<c-e>'
"let g:use_emmet_complete_tag = 1

let g:ctrlp_working_path_mode = 'ra'

" Tab completion - local
let g:SuperTabDefaultCompletionType = "<c-x><c-p>"

" Vdebug options
let g:vdebug_options = {"on_close":"detach", 'port': 9001}
" Set the codesniffer args
let g:phpqa_codesniffer_args = "--standard=PSR2"
" Don't run messdetector on save (default = 1)
let g:phpqa_messdetector_autorun = 0

let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_enable_balloons = 1
let g:syntastic_auto_loc_list=1
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_javascript_eslint_exe='/Users/xjz/mongo/project/node_modules/.bin/eslint'
let g:syntastic_mode_map = { 'mode': 'active',
        \                    'active_filetypes' : [],
        \                    'passive_filetypes' : ['php', 'html', 'js'] }

let NERDTreeIgnore = ['\.pyc$','\.sock$']

let g:vdebug_features = {'max_depth':3}

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
"}}}

"Fugitive (Git) in status line
set statusline=%{exists(\"*fugitive#statusline\")?\"branch:\ \".fugitive#statusline():\"\"}\ %F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]
" always display status line
set laststatus=2

"file encodings
set fileencodings=utf-8,gbk,ucs-born,cp936
" set fold method
set foldmethod=indent
"Spaces, not tabs
set shiftwidth=4
set tabstop=4
set expandtab
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2                                                   
autocmd FileType html setlocal shiftwidth=2 tabstop=2

"search highlight
set hlsearch
"line number
set nu
"hide toolbar
set guioptions-=T

" Save a file that requires sudoing even when
" you opened it as a normal user.
command! Sw w !sudo tee % > /dev/null

" backup to ~/.tmp 
set backup 
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set backupskip=/tmp/*,/private/tmp/* 
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set writebackup

" twig syntax highlighting
au BufRead,BufNewFile *.twig set filetype=jinja
