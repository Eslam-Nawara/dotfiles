let g:vimspector_base_dir='/home/eslam/.vim/plugged/vimspector'

function! DebugUI()
    if has_key(g:vimspector_session_windows, 'terminal')
        call win_gotoid(g:vimspector_session_windows.terminal)
        wincmd J
    endif

    if has_key(g:vimspector_session_windows, 'output')
        call win_gotoid(g:vimspector_session_windows.output)
        quit
    endif

    if has_key(g:vimspector_session_windows, 'stack_trace')
        call win_gotoid(g:vimspector_session_windows.stack_trace)
        quit
    endif

    if has_key(g:vimspector_session_windows, 'code')
        call win_gotoid(g:vimspector_session_windows.code)
        vertical resize 130
        resize 22
    endif
endfunction

autocmd User VimspectorTerminalOpened call DebugUI()

function! Compile()
    let l:file_name = expand('%')
    let l:file_type = &filetype

    if l:file_type == 'c'
        call system(printf('gcc -g %s -o debug', l:file_name))
    elseif l:file_type == 'cpp'
        call system(printf('g++ -g %s -o debug', l:file_name))
    endif
endfunction

nmap <F5> <cmd>write<CR> <cmd>call Compile()<CR> <Plug>VimspectorContinue
nmap <F6> <cmd>call delete('debug')<CR> <Plug>VimspectorStop
nmap <F7> <cmd>write <CR> <cmd>call Compile()<CR> <Plug>VimspectorRestart
nmap <S-F5> <cmd>call delete('debug')<CR> <cmd>VimspectorReset<CR> <cmd>bdelete! sh<CR>
nmap <F8> <Plug>VimspectorToggleConditionalBreakpoint
nmap <F9> <Plug>VimspectorToggleBreakpoint
nmap <S-F9> <cmd>call vimspector#ClearBreakpoints()<CR>
nmap <F10> <Plug>VimspectorStepOver
nmap <S-F10> <Plug>VimspectorRunToCursor
nmap <F11> <Plug>VimspectorStepInto
nmap <F12> <Plug>VimspectorStepOut
