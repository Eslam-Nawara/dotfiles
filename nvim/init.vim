set nocompatible
set path+=**,.**
set wildmenu
set clipboard=unnamedplus
set encoding=utf-8
set showcmd
set mouse=a
set secure exrc
set guicursor=
set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set signcolumn=yes
set colorcolumn=100
set foldmethod=marker
set termguicolors
set updatetime=100

call plug#begin( '~/.vim/plugged')
Plug 'mbbill/undotree'
Plug 'morhetz/gruvbox'
Plug 'kovetskiy/sxhkd-vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'
Plug 'iamcco/coc-spell-checker'
Plug 'jez/vim-better-sml'
Plug 'puremourning/vimspector'
Plug 'CRAG666/code_runner.nvim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'vim-autoformat/vim-autoformat'
Plug 'tpope/vim-commentary'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'farmergreg/vim-lastplace'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'akinsho/toggleterm.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'
Plug 'sainnhe/gruvbox-material'
Plug 'williamboman/mason.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
call plug#end()

"remaps
let mapleader = " "
nmap <silent><TAB> :bn <cr>
nmap <silent><A-TAB> :bp <cr>
nmap <silent><A-ESC> :bd <cr>
nmap <leader>fm :Autoformat<cr>
nmap <leader>gg :Git<cr>

let g:formatters_go = ['gofumpt']

autocmd BufWinEnter * GitGutterLineNrHighlightsEnable
