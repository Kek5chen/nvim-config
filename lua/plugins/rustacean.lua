local opts = { silent = true }

vim.api.nvim_set_keymap('n', '<leader>rr', ':RustLsp runnables<CR>', { noremap=true, silent=true })
vim.api.nvim_set_keymap('n', '<leader>rd', ':RustLsp debuggables<CR>', { noremap=true, silent=true })
vim.api.nvim_set_keymap('n', '<C-d>', ':RustLsp renderDiagnostic<CR>', { noremap=true, silent=true })
vim.api.nvim_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', {noremap = true, silent = true})

