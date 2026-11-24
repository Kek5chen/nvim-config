local crates = require("crates")
local server_name = "crates.nvim"

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("CargoManifestCompletion", { clear = true }),
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.name == server_name then
      require("plugins.native-lsp").attach(client, event.buf)
    end
  end,
})

crates.setup({
  lsp = {
    name = server_name,
    enabled = true,
    actions = true,
    completion = true,
    hover = true,
  },
  popup = { autofocus = true },
  completion = {
    crates = { enabled = true, min_chars = 2, max_results = 8 },
  },
  on_attach = function(bufnr)
    local function map(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
    end

    map("n", "<leader>ct", crates.toggle, "Toggle crate information")
    map("n", "<leader>cr", crates.reload, "Reload crate information")
    map("n", "<leader>cv", crates.show_versions_popup, "Show crate versions")
    map("n", "<leader>cf", crates.show_features_popup, "Show crate features")
    map("n", "<leader>cd", crates.show_dependencies_popup, "Show crate dependencies")
    map("n", "<leader>cu", crates.update_crate, "Update crate")
    map("x", "<leader>cu", crates.update_crates, "Update selected crates")
    map("n", "<leader>cU", crates.upgrade_crate, "Upgrade crate")
    map("x", "<leader>cU", crates.upgrade_crates, "Upgrade selected crates")
    map("n", "<leader>cm", crates.update_all_crates, "Update all crates")
    map("n", "<leader>cM", crates.upgrade_all_crates, "Upgrade all crates")
  end,
})
