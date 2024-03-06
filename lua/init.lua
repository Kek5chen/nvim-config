-- Setup lazy.nvim

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

require("lazy").setup({
  "nvim-treesitter/nvim-treesitter",
	"preservim/nerdtree",
	"tpope/vim-surround",
	"tpope/vim-commentary",
	"vim-airline/vim-airline",
	"ap/vim-css-color",
	"rafi/awesome-vim-colorschemes",
	"ryanoasis/vim-devicons",
	"preservim/tagbar",
	"dense-analysis/ale",
	"nvim-lua/plenary.nvim",
  {
	  "NeogitOrg/neogit",
    cmd = "Neogit",
  },
  {
	  "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
  },
	"mhinz/vim-startify",
  {
    "Eandrju/cellular-automaton.nvim",
    cmd = "CellularAutomaton",
  },
  "Civitasv/cmake-tools.nvim",
  "stevearc/overseer.nvim",
  "akinsho/toggleterm.nvim",
})

-- Setup neogit

require('neogit').setup {
	integrations = {
		diffview = true
	},
	kind = "split"
}

-- treesitter
require('nvim-treesitter.configs').setup {
  ensure_installed = { "c", "cpp", "lua", "vim", "nix", "glsl" },
  highlight = {
    enable = true,
  },
}

-- cmake-tools
require("cmake-tools").setup({})

-- overseer
require('overseer').setup()

-- he's crazy

print("he's crazy")
