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
  -- "nvim-treesitter/nvim-treesitter",


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
  "pocco81/auto-save.nvim",
  "windwp/nvim-autopairs",

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
  -- "hrsh7th/vim-vsnip",
  -- "hrsh7th/cmp-vsnip",
  -- "hrsh7th/cmp-nvim-lsp",
  -- "hrsh7th/cmp-buffer",
  -- "hrsh7th/cmp-path",
  -- "hrsh7th/cmp-cmdline",
  -- "hrsh7th/nvim-cmp",
  -- {
  --   "dundalek/lazy-lsp.nvim",
  --   dependencies = { "neovim/nvim-lspconfig" },
  -- },
  -- 'stevearc/conform.nvim',
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      { "ms-jpq/coq_nvim", branch = "coq" },
      { "ms-jpq/coq.artifacts", branch = "artifacts" },
      { "ms-jpq/coq.thirdparty", branch = "3p" },
      { "nvim-autopairs" }
    },
    init = function()
      local remap = vim.api.nvim_set_keymap
      local npairs = require('nvim-autopairs')

      npairs.setup({ map_bs = false, map_cr = false })

      vim.g.coq_settings = {
        keymap = { 
          recommended = false,
          bigger_preview = "<c-k>",
        }, 
        auto_start = true
      }

      -- these mappings are coq recommended mappings unrelated to nvim-autopairs
      remap('i', '<esc>', [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
      remap('i', '<c-c>', [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })
      remap('i', '<tab>', [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true, noremap = true })
      remap('i', '<s-tab>', [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })

      -- skip it, if you use another global object
      _G.MUtils= {}

      MUtils.CR = function()
        if vim.fn.pumvisible() ~= 0 then
          if vim.fn.complete_info({ 'selected' }).selected ~= -1 then
            return npairs.esc('<c-y>')
          else
            return npairs.esc('<c-e>') .. npairs.autopairs_cr()
          end
        else
          return npairs.autopairs_cr()
        end
      end
      remap('i', '<cr>', 'v:lua.MUtils.CR()', { expr = true, noremap = true })

      MUtils.BS = function()
        if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ 'mode' }).mode == 'eval' then
          return npairs.esc('<c-e>') .. npairs.autopairs_bs()
        else
          return npairs.autopairs_bs()
        end
      end
      remap('i', '<bs>', 'v:lua.MUtils.BS()', { expr = true, noremap = true })
    end,
    config = function()
      -- Your LSP settings here
    end,
  },

  -- debugging
  "mfussenegger/nvim-dap",
  "nvim-neotest/nvim-nio",
  "rcarriga/nvim-dap-ui",
  -- "puremourning/vimspector",
})

require "plugins/cmake-tools"
-- require "plugins/crates"
require "plugins/dap"
-- require "plugins/haskell-tools"
require "plugins/neogit"
-- require "plugins/nvim-cmp"
require "plugins/nvim-dap-ui"
-- require "plugins/nvim-lspconfig"
require "plugins/overseer"
require "plugins/presence"
require "plugins/rustacean"
require "plugins/telescope"
-- require "plugins/treesitter"
require "plugins/gitsigns"
require "plugins/nvim-autopairs"

print("he's crazy")

