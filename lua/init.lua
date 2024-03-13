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
  -- "dense-analysis/ale",
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
  "Saecki/crates.nvim",
  "mrcjkb/rustaceanvim",
  "mattn/webapi-vim",
  "mattn/webapi-vim",
  "hrsh7th/nvim-cmp",
  "neovim/nvim-lspconfig",
  "hrsh7th/vim-vsnip",
  -- "hrsh7th/cmp-vsnip",
  "hrsh7th/cmp-nvim-lsp",
  -- "hrsh7th/cmp-buffer",
  -- "hrsh7th/cmp-path",
  -- "hrsh7th/cmp-cmdline",
  "mfussenegger/nvim-dap",
  "rcarriga/nvim-dap-ui",
  -- "puremourning/vimspector",

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
  ensure_installed = { "c", "cpp", "lua", "vim", "nix", "glsl", "rust" },
  highlight = {
    enable = true,
  },
}

-- cmake-tools
require("cmake-tools").setup({})

-- overseer
require('overseer').setup()

-- crates
local crates = require('crates')
local opts = { silent = true }

crates.setup()

vim.keymap.set("n", "<leader>ct", crates.toggle, opts)
vim.keymap.set("n", "<leader>cr", crates.reload, opts)

vim.keymap.set("n", "<leader>cv", crates.show_versions_popup, opts)
vim.keymap.set("n", "<leader>cf", crates.show_features_popup, opts)
vim.keymap.set("n", "<leader>cd", crates.show_dependencies_popup, opts)

vim.keymap.set("n", "<leader>cu", crates.update_crate, opts)
vim.keymap.set("v", "<leader>cu", crates.update_crates, opts)
vim.keymap.set("n", "<leader>ca", crates.update_all_crates, opts)
vim.keymap.set("n", "<leader>cU", crates.upgrade_crate, opts)
vim.keymap.set("v", "<leader>cU", crates.upgrade_crates, opts)
vim.keymap.set("n", "<leader>cA", crates.upgrade_all_crates, opts)

-- neodev

-- require('neodev').setup()

-- nvim-lspconfig

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  end,
})

-- rustacean

local opts = { silent = true }

vim.api.nvim_set_keymap('n', '<leader>rr', ':RustLsp runnables<CR>', { noremap=true, silent=true })
vim.api.nvim_set_keymap('n', '<leader>rd', ':RustLsp debuggables<CR>', { noremap=true, silent=true })

-- debug adapter

-- local dap = require("dap")
-- dap.adapters.gdb = {
--   type = "executable",
--   command = "gdb",
--   args = { "-i", "dap" }
-- }
-- dap.configurations.c = {
--   {
--     name = "Lauch",
--     type = "gdb",
--     request = "launch",
--     program = function()
--       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--     end,
--     cwd = "${workspaceFolder}",
--     stopAtBeginningOfMainSubprogram = false,
--   },
-- }

-- nvim-cmp

local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
--    { name = 'vsnip' }, -- For vsnip users.
--    { name = 'buffer' },
  })
})

-- nvim-dap-ui

require("dapui").setup()

vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<F9>', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<F9>', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>du', function() require('dapui').toggle() end)

-- he's crazy

print("he's crazy")

