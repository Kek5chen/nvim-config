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
	"neoclide/coc.nvim",
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "c", "lua", "vim", "vimdoc", "javascript", "typescript", "cpp", "html" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end
  },
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
	  "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
  },
  {
	  "NeogitOrg/neogit",
    cmd = "Neogit",
  },
	"mhinz/vim-startify",
  {
    "Eandrju/cellular-automaton.nvim",
    cmd = "CellularAutomaton",
  }
})

-- Setup neogit

require('neogit').setup {
	integrations = {
		diffview = true
	},
	kind = "split"
}

-- he's crazy

print("he's crazy")
