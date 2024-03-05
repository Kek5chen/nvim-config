-- Setup lazy.nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"neoclide/coc.nvim",
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
--	"nvim-telescope/telescope.nvim",
	"NeogitOrg/neogit",
	"mhinz/vim-startify",
})

-- Setup neogit

require('neogit').setup {
	integrations = {
		diffview = true
	},
	kind = "split"
}

print("he's crazy")
