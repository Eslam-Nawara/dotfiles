require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'modus-vivendi',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'progress'},
    lualine_y = {'filetype'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {  
    lualine_a = {
        {
            'buffers',
            symbols = {
                 modified = ' ●',
                 alternate_file = '',
                 directory =  '',
            }
        }
    },
  extensions = {}

    }
}
