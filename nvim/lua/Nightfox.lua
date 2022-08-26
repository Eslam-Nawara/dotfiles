local options = {
    transparent = true,
    treminal_colors = true,
    styles = {
        comments = "italic",
        functions = "bold",
        numbers = "bold",
        operators = "bold",
        strings = "italic",
    }
}

local palettes = {
    nightfox = {
        black   = '#282a36',
        white   = '#f8f8f2',
        red     = '#ff5555',
        green   = '#78b060',
        blue    = '#6484cb',
        yellow  = '#f1fa8c',
        magenta = '#bd93f9',
        cyan    = '#8be9fd',
        orange  = '#ffb86c',
        pink    = '#ff79c6',
        comment = '#7c839c',
        sel1    = '#44475a',
        sel2    = '#c082a1' 
    } 
}
require('nightfox').setup{
    options = options,
    palettes = palettes
}
vim.cmd("colorscheme nightfox")
