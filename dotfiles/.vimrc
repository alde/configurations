set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'davidhalter/jedi-vim'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Chiel92/vim-autoformat'
Plugin 'fatih/vim-go'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'SirVer/ultisnips'
Plugin 'jiangmiao/auto-pairs'
Plugin 'Valloric/YouCompleteMe'
Plugin 'luochen1990/rainbow'
Plugin 'slim-template/vim-slim.git'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'cohlin/vim-colorschemes'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'honza/vim-snippets'

call vundle#end()            " required
filetype plugin indent on    " required

" Tabs and Colors
" color scheme of the moment: 'py-darcula'
syntax on
let g:airline_theme = "darcula"
colorscheme py-darcula

let g:rainbow_active = 1
set et
set tabstop=4
set colorcolumn=80

" Misc
set number
set hidden
set backspace=indent,eol,start

" Setup Extra whitespace highlighting
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$\| \+\ze\t/
autocmd FileType c,cpp,php,ruby,py,html,twig,java autocmd BufWritePre <buffer> :%s/\s\+$//e
nnoremap <CR> :noh<CR><CR>

" Autoformat file on save
au BufWrite *.py :Autoformat
au BufWrite *.rb :Autoformat
au BufWritePre * StripWhitespace

" Keymaps
let mapleader=";"
map <leader><space> :NERDTreeToggle<cr>

nnoremap <leader><leader> <C-^>
nnoremap <leader>s <C-W><C-J>
nnoremap <leader>n <C-W><C-K>
nnoremap <leader>r <C-W><C-L>
nnoremap <leader>l <C-W><C-H>

map <leader><F5> :source ~/.vimrc<CR>


" Go programming
au FileType go nmap <Leader>l <Plug>(go-metalinter)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <leader>d <Plug>(go-doc)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>t <Plug>(go-test)

au FileType go nmap gD <Plug>(go-doc)
au FileType go nmap gr <Plug>(go-rename)

let g:go_fmt_command="goimports"
let g:go_metalinter_enabled=['vet', 'golint', 'gocyclo']
let g:go_metalinter_autosave=1
let g:go_term_enabled = 0
let g:go_term_mode = "split"

" Toggle between test and implementation
nmap T :GoAlternate<CR>

filetype plugin indent on
au FileType ruby set softtabstop=2 tabstop=2 shiftwidth=2
au FileType php set softtabstop=4 tabstop=4 shiftwidth=4
au BufRead,BufNewFile *.twig set filetype=htmljinja

