-- Bootstrap lazy.nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugin Installation

require("lazy").setup({
  -- utils
  "nvim-lua/plenary.nvim",
  "ryanoasis/vim-devicons",
  "nvim-treesitter/nvim-treesitter",


  -- tools
  "mattn/webapi-vim",
  "rootkiter/vim-hexedit",


  -- effectivity
  "tpope/vim-commentary",
  {
    "NeogitOrg/neogit",
    cmd = "Neogit",
  },
  -- "akinsho/toggleterm.nvim",
  "mbbill/undotree",


  -- visuals
  "vim-airline/vim-airline",
  "ap/vim-css-color",
  "mhinz/vim-startify",
  "andweeb/presence.nvim",
  "lewis6991/gitsigns.nvim",


  -- themes
  "rafi/awesome-vim-colorschemes",

  -- finder
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },


  -- fun
  {
    "Eandrju/cellular-automaton.nvim",
    cmd = "CellularAutomaton",
  },


  -- integration & build
  "Civitasv/cmake-tools.nvim",
  "mrcjkb/rustaceanvim",
  "stevearc/overseer.nvim",
  "Saecki/crates.nvim",
  "mrcjkb/haskell-tools.nvim",


  -- lsp and completion
  "hrsh7th/vim-vsnip",
  "hrsh7th/cmp-vsnip",
  "hrsh7th/cmp-nvim-lsp",
  -- "hrsh7th/cmp-buffer",
  -- "hrsh7th/cmp-path",
  -- "hrsh7th/cmp-cmdline",
  "hrsh7th/nvim-cmp",
  {
    "dundalek/lazy-lsp.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
  },
  -- 'stevearc/conform.nvim',


  -- debugging
  "mfussenegger/nvim-dap",
  "nvim-neotest/nvim-nio",
  "rcarriga/nvim-dap-ui",
  -- "puremourning/vimspector",
})

require "plugins/cmake-tools"
require "plugins/crates"
require "plugins/dap"
-- require "plugins/haskell-tools"
require "plugins/neogit"
require "plugins/nvim-cmp"
require "plugins/nvim-dap-ui"
require "plugins/nvim-lspconfig"
require "plugins/overseer"
require "plugins/presence"
require "plugins/rustacean"
require "plugins/telescope"
require "plugins/treesitter"

print("he's crazy")

