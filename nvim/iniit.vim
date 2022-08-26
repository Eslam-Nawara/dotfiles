syntax on

set nocompatible
set path+=**,.**
set wildmenu
set clipboard=unnamedplus
set guicursor=
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set noswapfile
set nobackup
set undodir=$HOME/.vim/undodir
set undofile
set nowrap
set colorcolumn=80
set nohlsearch 
set encoding=utf-8
set showcmd
set incsearch
set hidden
set scrolloff=8
set mouse=a

au BufReadPost $HOME/.scripts/* set syntax=sh
au BufReadPost $HOME/.config/* set syntax=zsh

call plug#begin('$HOME/.vim/plugged')
" color schemes and icons
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

" LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" syntax highlighting
Plug 'kovetskiy/sxhkd-vim' 
Plug 'sheerun/vim-polyglot'
Plug 'mboughaba/i3config.vim'
Plug 'fladson/vim-kitty'

" undotree
Plug 'mbbill/undotree'

" Vimspector
Plug 'puremourning/vimspector'

" Code screenshot
Plug 'jmckiern/vim-shoot', {'do': '\"./install.py\" geckodriver'}

call plug#end()

" gruvbox config
let g:gruvbox_termcolors=256
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE

" coc config
let g:python3_host_prog='/usr/bin/python3'
let g:coc_global_extensions = [
    \ 'coc-pairs',
    \ 'coc-clangd',
    \ 'coc-sh'
    \ ]

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<CR>"

" Vimspector config
let g:vimspector_enable_mappings = 'HUMAN'

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
