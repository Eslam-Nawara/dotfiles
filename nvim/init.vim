syntax on

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

call plug#begin( '~/.vim/plugged')
Plug 'mbbill/undotree'
Plug 'morhetz/gruvbox'
Plug 'kovetskiy/sxhkd-vim'
Plug 'neoclide/coc.nvim', {'tag': 'v0.0.82'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'jiangmiao/auto-pairs'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'
Plug 'iamcco/coc-spell-checker'
Plug 'jez/vim-better-sml'
Plug 'EdenEast/nightfox.nvim'
Plug 'doums/darcula'
Plug 'puremourning/vimspector'
Plug 'CRAG666/code_runner.nvim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'darrikonn/vim-gofmt', { 'do': ':GoUpdateBinaries' }
Plug 'vim-autoformat/vim-autoformat'
Plug 'tpope/vim-commentary'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
call plug#end()

call plug#end()

"remaps
let mapleader = " "
nmap <leader>ff <cmd>Telescope find_files <cr>
nmap <leader>fd <cmd>Telescope find_files hidden=true <cr>
nmap <leader>ft <cmd> Telescope treesitter<cr>
nmap <leader>fg <cmd> Telescope live_grep<cr>
nmap <leader>fb <cmd> Telescope buffers<cr>
nmap <leader>fh <cmd> Telescope help_tags<cr>
nmap <silent><TAB> :bn <cr>
nmap <silent><A-TAB> :bp <cr>
nmap <silent><A-ESC> :bd <cr>

" Coc
nmap <silent> <leader>rn <Plug>(coc-rename)
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gD <Plug>(coc-declaration)
nmap <silent> <leader>gtd <Plug>(coc-type-definition)
nmap <silent> <leader>gr <Plug>(coc-references)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gP <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>ca <Plug>(coc-codeaction)
nmap <silent> <leader>qf <Plug>(coc-fix-current)
nmap <silent> <leader>K :call ShowDocumentation()<CR>
nmap <silent><nowait><expr> <C-u> coc#float#scroll(1)
nmap <silent><nowait><expr> <C-d> coc#float#scroll(0)
imap <silent><nowait><expr> <C-u> "\<C-r>=coc#float#scroll(0)\<CR>"
imap <silent><nowait><expr> <C-d> "\<C-r>=coc#float#scroll(1)\<CR>"
nmap <leader>cs <Plug>(coc-codeaction-selected)iw

nmap <leader>fm :Autoformat<cr>

"Themes config
colorscheme  nightfox
set termguicolors
hi Normal guibg=NONE ctermbg=NONE

source ~/.config/nvim/vimscript/vimspector.vim

lua << END
require ('Treesitter')
require ('Telescope')
require ('Lualine')
require ('Nightfox')
require ('CodeRunner')
END

" Restores the cursor position and its autocmd.
function! ResCur()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction
autocmd BufWinEnter * call ResCur()


"sml
function! UseREPL()
    write
    SMLReplStart
    wincmd J
    resize 13
    wincmd k
    SMLReplClear
    sleep 100m
    SMLReplUse
endfunction

augroup vimbettersml
    let g:sml_smlnj_executable = '/usr/lib/smlnj/bin/sml'

    au FileType sml nnoremap <silent> <buffer> <F4> :SMLReplStop<CR>:call UseREPL()<CR>
    au FileType sml nnoremap <silent> <buffer> <S-F4> :SMLReplStop<CR>
augroup END

" Tab completion
inoremap <expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <silent><expr> <Tab>
            \ coc#pum#visible() ? coc#pum#next(1) :
            \ CheckBackspace() ? "\<Tab>" :
            \ coc#refresh()
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" coc show documentation
function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
    else
        call feedkeys('K', 'in')
    endif
endfunction
