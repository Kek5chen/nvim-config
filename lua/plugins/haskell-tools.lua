local ht = require('haskell-tools')
local bufnr = vim.api.nvim_get_current_buf()
local opts = { noremap = true, silent = true, buffer = bufnr, }

-- haskell-language-server relies heavily on codeLenses,
-- so auto-refresh (see advanced configuration) is enabled by default
vim.keymap.set('n', '<space>cl', vim.lsp.codelens.run, opts)

-- Hoogle search for the type signature of the definition under the cursor
vim.keymap.set('n', '<space>hs', ht.hoogle.hoogle_signature, opts)

