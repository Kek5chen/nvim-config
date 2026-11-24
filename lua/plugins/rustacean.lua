local function attach(client, bufnr)
  local completion = client.server_capabilities.completionProvider
  if completion then
    -- Offer completions while typing identifiers as well as after `.` and `::`.
    local triggers = completion.triggerCharacters or {}
    for char in ("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_"):gmatch(".") do
      if not vim.tbl_contains(triggers, char) then
        triggers[#triggers + 1] = char
      end
    end
    completion.triggerCharacters = triggers
  end
  require("plugins.native-lsp").attach(client, bufnr)

  local function map(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
  end

  local function format()
    vim.lsp.buf.format({ bufnr = bufnr, id = client.id })
  end

  map("n", "gd", vim.lsp.buf.definition, "Go to definition")
  map("n", "gy", vim.lsp.buf.type_definition, "Go to type definition")
  map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
  map("n", "grr", vim.lsp.buf.references, "Find references")
  map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
  map({ "n", "x" }, "<leader>lf", format, "Format Rust code")
  vim.api.nvim_buf_create_user_command(bufnr, "Format", format, { desc = "Format Rust code" })

  map("n", "<leader>rr", "<cmd>RustLsp runnables<cr>", "Run Rust target")
  map("n", "<leader>rt", "<cmd>RustLsp testables<cr>", "Run Rust test")
  map("n", "<leader>rd", "<cmd>RustLsp debuggables<cr>", "Debug Rust target")
  map("n", "<leader>rm", "<cmd>RustLsp expandMacro<cr>", "Expand Rust macro")
  map({ "n", "x" }, "<leader>re", function()
    vim.lsp.buf.code_action({ context = { only = { "refactor" } } })
  end, "Refactor Rust code")
  map("n", "<leader>sa", function()
    vim.lsp.buf.code_action({ context = { only = { "source" } } })
  end, "Rust source actions")
  map("n", "<leader>cl", vim.lsp.codelens.run, "Run code lens action")
  map("n", "<leader>ri", function()
    local filter = { bufnr = bufnr }
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(filter), filter)
  end, "Toggle Rust inlay hints")
end

local function debugger()
  if vim.fn.has("win32") ~= 1 then
    return
  end
  local root = vim.fs.joinpath(vim.fn.stdpath("data"), "tools", "codelldb")
  local adapter = vim.fs.joinpath(root, "adapter", "codelldb.exe")
  local library = vim.fs.joinpath(root, "lldb", "bin", "liblldb.dll")
  if vim.fn.executable(adapter) == 1 and vim.uv.fs_stat(library) then
    return { adapter = require("rustaceanvim.config").get_codelldb_adapter(adapter, library) }
  end
end

vim.g.rustaceanvim = function()
  return {
    server = {
      on_attach = attach,
      default_settings = {
        ["rust-analyzer"] = {
          assist = { expressionFillDefault = "default" },
        },
      },
    },
    dap = vim.tbl_extend("force", { autoload_configurations = false }, debugger() or {}),
  }
end
