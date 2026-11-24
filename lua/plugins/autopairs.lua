local pairs = require("nvim-autopairs")
local M = {}

function M.setup()
  pairs.setup({ map_cr = false })
  vim.keymap.set("i", "<CR>", function()
    if vim.fn["coc#pum#visible"]() == 1 then
      return vim.fn["coc#pum#confirm"]()
    end
    return pairs.autopairs_cr()
  end, { expr = true, replace_keycodes = false, desc = "Confirm completion or insert newline" })
end

function M.confirm_native()
  if vim.fn.pumvisible() == 1 and vim.fn.complete_info({ "selected" }).selected >= 0 then
    return vim.keycode("<C-y>")
  end
  return pairs.autopairs_cr()
end

return M
