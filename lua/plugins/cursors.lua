local M = {}

function M.select_matches()
  if vim.g.coc_service_initialized ~= 1 then
    vim.notify("CoC is still starting", vim.log.levels.WARN)
    return
  end
  local word = vim.fn.expand("<cword>")
  if word == "" then return end
  local pattern = [[\C\<\V]] .. vim.fn.escape(word, [[\]]) .. [[\>]]
  local ranges = {}
  for line_number, line in ipairs(vim.api.nvim_buf_get_lines(0, 0, -1, false)) do
    local offset = 0
    while offset < #line do
      local _, first, last = unpack(vim.fn.matchstrpos(line, pattern, offset))
      if first < 0 then break end
      ranges[#ranges + 1] = {
        start = { line = line_number - 1, character = vim.str_utfindex(line, "utf-16", first) },
        ["end"] = { line = line_number - 1, character = vim.str_utfindex(line, "utf-16", last) },
      }
      offset = last
    end
  end
  if #ranges > 0 then
    vim.fn.CocActionAsync("runCommand", "editor.action.addRanges", ranges)
  end
end

return M
