return {
  "kyazdani42/nvim-web-devicons",
  { "lewis6991/gitsigns.nvim", opts = { numhl = true } },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = {
        char = "┊",
      }
    },
  },
  {
    "sainnhe/gruvbox-material",
    enabled = false,
    config = function()
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_foreground = "mix"
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_transparent_background = 1
      vim.g.gruvbox_material_better_performance = 1
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 100,
    opts = {
      background = { -- :h background
        light = "latte",
        dark = "macchiato",
      },
      transparent_background = false,
      styles = {
        comments = { "italic" },
        conditionals = { "bold" },
        loops = { "bold" },
        functions = { "bold" },
        keywords = {},
        strings = { "italic" },
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      integrations = {
        cmp = true,
        mason = true,
        fidget = false,
        gitsigns = true,
        nvimtree = false,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        dap = {
          enabled = true,
          enabled_ui = true,
        },
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
        },
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
