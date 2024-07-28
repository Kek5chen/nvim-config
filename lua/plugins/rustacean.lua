local opts = { silent = true }

vim.api.nvim_set_keymap('n', '<leader>rr', ':RustLsp runnables<CR>', { noremap=true, silent=true })
vim.api.nvim_set_keymap('n', '<leader>rd', ':RustLsp debuggables<CR>', { noremap=true, silent=true })

