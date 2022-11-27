require('telescope').setup {
    defaults = {
      layout_strategy = 'horizontal',
      layout_config = { 
          height = 0.8,
          width = 0.9,
          preview_width = 0.6,
          scroll_speed = 1
      },
    },
}
vim.keymap.set('n', "<leader>ff", "<cmd>Telescope find_files<CR>")
vim.keymap.set('n', "<leader>fh", "<cmd>Telescope find_files hidden=true<CR>")
vim.keymap.set('n', "<leader>fb", "<cmd>Telescope buffers<CR>")
vim.keymap.set('n', "<leader>fg", "<cmd>Telescope live_grep<CR>")
vim.keymap.set('n', "<leader>ft", "<cmd>Telescope treesitter<CR>")
vim.keymap.set('n', "<leader>fk", "<cmd>Telescope keymaps<CR>")
vim.keymap.set('n', "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>")
