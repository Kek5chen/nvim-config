local crates = require('crates')
local opts = { silent = true }

crates.setup {
  lsp = {
    enabled = true,
    on_attach = function(client, bufnr)
    end,
    actions = true,
    completion = true,
    hover = true, 
  },

  popup = {
      autofocus = true,
  },

  completion = {
    crates = {
      enabled = true,
      min_chars = 2,
      max_results = 8,
    },
  },
}

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

