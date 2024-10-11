local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  use "antonio-hickey/Oracle.nvim" -- Interact with language models within neovim
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim" -- Easily comment stuff
  use "kyazdani42/nvim-web-devicons" -- Icons
  use "stevearc/oil.nvim" -- File manager with buffer like mutability
  use "moll/vim-bbye" -- Ability to delete buffers without closing window
  use "akinsho/toggleterm.nvim" -- Terminal plugin
  use "lukas-reineke/indent-blankline.nvim" -- auto indent new lines
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use "folke/which-key.nvim" -- Display menu for my custom keybinds
  use "folke/zen-mode.nvim" -- Focus mode
  use "nvim-telescope/telescope.nvim" -- fuzzy finder
  use "nvim-lualine/lualine.nvim" -- better status line
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "hrsh7th/cmp-nvim-lsp" -- completion for neovim builtin lsp client
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "mrcjkb/rustaceanvim"  -- better rust dx
  use "roobert/tailwindcss-colorizer-cmp.nvim" -- better tailwind dx
  use {"ellisonleao/glow.nvim", config = function() require("glow").setup() end} -- better markdown dx
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets
  use "neovim/nvim-lspconfig" -- LSP
  use "williamboman/mason.nvim" -- LSP manager
  use "williamboman/mason-lspconfig.nvim" -- LSP Config manager
  use "lewis6991/gitsigns.nvim" -- git integration for buffers

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- Obsidian
  use({
    "epwalsh/obsidian.nvim",
    tag = "*",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("obsidian").setup({
        workspaces = {
          {
            name = "personal",
            path = "~/hick-vault/",
          },
        },
      })
    end,
  })

  -- Colorschemes
  use "luisiacc/gruvbox-baby"
  use "aktersnurra/no-clown-fiesta.nvim"
	use "rose-pine/neovim"
  use "antonio-hickey/citrus-mist"

  -- Automatically set up configuration after cloning packer.nvim
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
