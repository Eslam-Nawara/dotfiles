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
