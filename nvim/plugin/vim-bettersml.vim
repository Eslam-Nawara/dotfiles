"sml
function! UseREPL()
    write
    SMLReplStart
    wincmd J
    resize 10
    wincmd k
    SMLReplClear
    sleep 100m
    SMLReplUse
endfunction

augroup vimbettersml
    let g:sml_smlnj_executable = '/usr/lib/smlnj/bin/sml'

    au FileType sml nnoremap <silent> <buffer> <F2> :SMLReplStop<CR>:call UseREPL()<CR>
    au FileType sml nnoremap <silent> <buffer> <S-F2> :SMLReplStop<CR>
augroup END

