require('code_runner').setup {
    mode = 'term',
    focus = true,
    term = {
        size = 10
    },
    filetype = {
        go = 'go run $fileName',
        javascript = 'node $fileName',
        c = 'gcc $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt && rm $fileNameWithoutExt',
        cpp = 'g++ $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt && rm $fileNameWithoutExt',
        rust = 'cargo run',
        python = 'python3 $fileName',
        scheme = 'racket $fileName',
    },

    vim.keymap.set('n', '<F1>', ':w<CR>:RunCode<CR>', { noremap = true, silent = true }),
    vim.keymap.set('n', '<S-F1>', ':RunClose<CR>', { noremap = true, silent = true }),
}
