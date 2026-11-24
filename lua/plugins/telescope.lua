local M = {}

local function project_root()
  return vim.fs.root(0, ".git") or vim.fs.root(0, "Cargo.toml") or vim.fn.getcwd()
end

function M.setup()
  local telescope = require("telescope")
  telescope.setup({
    defaults = {
      file_ignore_patterns = { "[\\/]%.git[\\/]" },
      layout_strategy = "flex",
      layout_config = {
        width = 0.94,
        height = 0.85,
        flip_columns = 110,
      },
    },
    extensions = {
      file_browser = { theme = "ivy" },
    },
  })
  telescope.load_extension("file_browser")
end

function M.keymaps()
  vim.keymap.set("n", "<leader>ff", function()
    require("telescope.builtin").find_files({ cwd = project_root() })
  end, { desc = "Find project files" })
  vim.keymap.set("n", "<leader>fg", function()
    require("telescope.builtin").live_grep({ cwd = project_root() })
  end, { desc = "Search project text" })
  vim.keymap.set("n", "<leader>fe", function()
    require("telescope").extensions.file_browser.file_browser({ cwd = project_root() })
  end, { desc = "Browse project files" })
  vim.keymap.set("n", "<leader>fs", function()
    if #vim.lsp.get_clients({ bufnr = 0, method = "textDocument/documentSymbol" }) > 0 then
      require("telescope.builtin").lsp_document_symbols()
    else
      vim.cmd.CocList("outline")
    end
  end, { desc = "Find symbols in file" })
  vim.keymap.set("n", "<leader>fS", function()
    if #vim.lsp.get_clients({ bufnr = 0, method = "workspace/symbol" }) > 0 then
      require("telescope.builtin").lsp_dynamic_workspace_symbols()
    else
      vim.cmd.CocList("symbols")
    end
  end, { desc = "Find symbols in workspace" })
end

return M
