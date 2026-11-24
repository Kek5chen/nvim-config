local M = {}
local references = vim.api.nvim_create_augroup("LspReferences", { clear = true })

function M.attach(client, bufnr)
  vim.b[bufnr].native_lsp = true
  vim.b[bufnr].coc_suggest_disable = 1

  local function map(mode, lhs, rhs, desc, opts)
    vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", {
      buffer = bufnr,
      silent = true,
      desc = desc,
    }, opts or {}))
  end

  if client:supports_method("textDocument/completion") then
    vim.bo[bufnr].completeopt = "menu,menuone,noselect,popup"
    vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
    map("i", "<C-Space>", function() vim.lsp.completion.get() end, "Trigger completion")
    map("i", "<Tab>", function()
      return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
    end, "Next completion or indent", { expr = true })
    map("i", "<S-Tab>", function()
      return vim.fn.pumvisible() == 1 and "<C-p>" or "<C-d>"
    end, "Previous completion or unindent", { expr = true })
    map("i", "<CR>", require("plugins.autopairs").confirm_native, "Confirm completion or insert newline", {
      expr = true,
      replace_keycodes = false,
    })
  end

  map("n", "[g", function() vim.diagnostic.jump({ count = -1, float = true }) end, "Previous diagnostic")
  map("n", "]g", function() vim.diagnostic.jump({ count = 1, float = true }) end, "Next diagnostic")
  map({ "n", "x" }, "<leader>a", vim.lsp.buf.code_action, "Code actions")
  map({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, "Code actions for selection")
  map("n", "<leader>qf", function()
    vim.lsp.buf.code_action({ context = { only = { "quickfix" } }, apply = true })
  end, "Quick fix")
  map("n", "K", vim.lsp.buf.hover, "Hover documentation")
  map("n", "<leader>ld", vim.diagnostic.open_float, "Show line diagnostics")

  if client:supports_method("textDocument/documentHighlight") then
    vim.api.nvim_clear_autocmds({ group = references, buffer = bufnr })
    vim.api.nvim_create_autocmd("CursorHold", {
      buffer = bufnr,
      group = references,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI", "BufLeave" }, {
      buffer = bufnr,
      group = references,
      callback = vim.lsp.buf.clear_references,
    })
  end
end

return M
