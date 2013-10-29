execute pathogen#infect()
" color scheme of the moment:
syntax on

if has('gui_running')
    set background=light
else
    set background=dark
endif

colorscheme solarized

set et
set tabstop=4
set colorcolumn=80
set backspace=indent,eol,start
" Setup Extra whitespace highlighting
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$\| \+\ze\t/
autocmd FileType c,cpp,php,ruby,py,html,twig,java autocmd BufWritePre <buffer> :%s/\s\+$//e

filetype plugin indent on
au FileType ruby set softtabstop=2 tabstop=2 shiftwidth=2
au FileType php set softtabstop=4 tabstop=4 shiftwidth=4
au BufRead,BufNewFile *.twig set filetype=htmljinja
