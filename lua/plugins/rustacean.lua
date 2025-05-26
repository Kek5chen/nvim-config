-- vim.api.nvim_set_keymap('n', '<leader>rr', ':RustLsp runnables<CR>', { noremap=true, silent=true })
-- vim.api.nvim_set_keymap('n', '<leader>rd', ':RustLsp debuggables<CR>', { noremap=true, silent=true })
-- vim.api.nvim_set_keymap('n', '<C-d>', ':RustLsp renderDiagnostic<CR>', { noremap=true, silent=true })
-- vim.api.nvim_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', {noremap = true, silent = true})

local bufnr = vim.api.nvim_get_current_buf()
-- vim.keymap.set(
--   "n", 
--   "K",  -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
--   function()
--     vim.cmd.RustLsp({'hover', 'actions'})
--   end,
--   { silent = true, buffer = bufnr }
-- )

vim.g.rustaceanvim = {
  tools = {
  },
  server = {
    on_attach = function(client, bufnr)
    end,
    default_settings = {
      ['rust-analyzer'] = {
        assist = {
          expressionFillDefault = "default"
        }
      },
    },
  },
  -- DAP configuration
  dap = {
  },
}
