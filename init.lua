local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none", "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " " 
vim.g.maplocalleader = "\\" 
vim.g.mapleader = " "
vim.wo.number = true
-- key bindess

vim.keymap.set("n", "<leader>Td", vim.cmd.tabLast)
vim.keymap.set("n", "<leader>Tn", vim.cmd.tabNext)
vim.keymap.set("n", "<leader>TN", vim.cmd.tabnew)
vim.keymap.set("n", "<leader>ff", vim.cmd.Ex)
vim.keymap.set("n", "<leader>fz", vim.cmd.Telescope)
vim.keymap.set("n", "<leader>Hh", vim.lsp.buf.hover, {})
vim.keymap.set('n', '<leader>Hd', vim.lsp.buf.definition, {})
vim.keymap.set({ 'n', 'v' }, '<leader>Ha', vim.lsp.buf.code_action, {})
vim.keymap.set('n', '<leader>Cm', vim.cmd.make)

require("lazy").setup({
  "folke/which-key.nvim",
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  "folke/neodev.nvim",
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "folke/noice.nvim",
      event = "VeryLazy",
       opts = {
       -- add any options here
       },
       dependencies = {
       "MunifTanjim/nui.nvim",
      	 
       "rcarriga/nvim-notify",
    },
},
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
{
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' } },
{
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
},
{
    "williamboman/mason.nvim"
},
{
"williamboman/mason-lspconfig.nvim",
},
{"neovim/nvim-lspconfig"},
{'nvim-telescope/telescope-ui-select.nvim' },
{'tamton-aquib/staline.nvim'},
{'edluffy/specs.nvim'},
{
    "roobert/tabtree.nvim",
    config = function()
      require("tabtree").setup()
    end,
  },
 {
    'mikesmithgh/kitty-scrollback.nvim',
    enabled = true,
    lazy = true,
    cmd = { 'KittyScrollbackGenerateKittens', 'KittyScrollbackCheckHealth' },
    event = { 'User KittyScrollbackLaunch' },
    -- version = '*', -- latest stable version, may have breaking changes if major version changed
    -- version = '^4.0.0', -- pin major version, include fixes and features that do not have breaking changes
    config = function()
      require('kitty-scrollback').setup()
    end,
  },
  {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
},
{'folke/lsp-colors.nvim'},
{
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      -- config
    }
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
},
{
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
}
-- plugins/telescope.lua:
})
require("lsp-colors").setup({
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981"
})
require('staline').setup()
require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true, 
    show_end_of_buffer = false, -- ss
    term_colors = false, -- sets ter
    dim_inactive = {
        enabled = false, -- dims the
        shade = "dark",
        percentage = 0.15, -- percenow
    },
    no_italic = false, -- Force no i
    no_bold = false, -- Force no bol
    no_underline = false, -- Force no
    styles = { -- Handles the styles:
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    color_overrides = {},
    custom_highlights = {},
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = true,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
    },
})
require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}
-- This is your opts table
require("telescope").setup {
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      }

      -- pseudo code / specification for writing custom displays, like the one
      -- for "codeactions"
      -- specific_opts = {
      --   [kind] = {
      --     make_indexed = function(items) -> indexed_items, width,
      --     make_displayer = function(widths) -> displayer
      --     make_display = function(displayer) -> function(e)
      --     make_ordinal = function(e) -> string
      --   },
      --   -- for example to disable the custom builtin "codeactions" display
      --      do the following
      --   codeactions = false,
      -- }
    }
  }
}
-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("ui-select")
-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"

require("mason").setup()
require("mason-lspconfig").setup({
	ensurde_installed = {"lua_ls", "clangd" ,"rust-analyzer",}
})
--rust-analyzer
local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup({})
lspconfig.clangd.setup({})
lspconfig.rust_analyzer.setup({})

require("lazy").setup(plugins, opts)
