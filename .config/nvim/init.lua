require "hickey.options"
require "hickey.keymaps"
require "hickey.plugins"
require "hickey.colorscheme"
require "hickey.cmp"
require "hickey.lsp"
require "hickey.telescope"
require "hickey.treesitter"
require "hickey.autopairs"
require "hickey.comment"
require "hickey.gitsigns"
require "hickey.nvim-tree"
--require "hickey.bufferline"
require "hickey.lualine"
require "hickey.toggleterm"
require "hickey.project"
require "hickey.impatient"
require "hickey.indentline"
require "hickey.alpha"
require "hickey.whichkey"
require "hickey.autocommands"
require("transparent").setup({
  extra_groups = { -- table/string: additional groups that should be cleared
    -- In particular, when you set it to 'all', that means all available groups
    -- example of akinsho/nvim-bufferline.lua
    "BufferLineTabClose",
    "BufferlineBufferSelected",
    "BufferLineFill",
    "BufferLineBackground",
    "BufferLineSeparator",
    "BufferLineIndicatorSelected",
  },
})

-- This fixes weird bug of nvim-tree not working
require'nvim-tree'.setup {}
