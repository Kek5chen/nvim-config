local actions = {
  { name = "Review", prompt = "Review the selected code. Report actionable findings with file and line references. Give review findings only." },
  { name = "Refactor", prompt = "Refactor the selected code for clarity and maintainability. Preserve observable behavior and run relevant checks." },
  { name = "Fix", prompt = "Diagnose and fix the issue in the selected code. Check the surrounding code and diagnostics as needed, then verify the fix." },
  { name = "Implement", prompt = "Implement the intent of the selected code, TODO, or description. Ask about any missing requirements that affect the result, and run relevant checks." },
}

local function draft_for_selection()
  local cli = require("sidekick.cli")
  local path = vim.api.nvim_buf_get_name(0)
  local template = vim.fn.filereadable(path) == 1 and "{position}\n\n{selection}" or "{selection}"
  local _, selection = cli.render(template)
  if not selection or #selection == 0 then
    vim.notify("Select some text for an AI action", vim.log.levels.WARN)
    return
  end

  vim.ui.select(actions, {
    prompt = "AI action for selected text",
    format_item = function(action) return action.name end,
  }, function(action)
    if action then
      local text = vim.list_extend({ { { action.prompt } }, {} }, selection)
      cli.send({ text = text, filter = { installed = true }, submit = false })
    end
  end)
end

return {
  "folke/sidekick.nvim",
  cmd = "Sidekick",
  opts = function()
    local tools = {}
    if vim.fn.has("win32") == 1 then
      for _, name in ipairs({ "claude", "codex", "gemini" }) do
        if vim.endswith(vim.fn.exepath(name):lower(), ".cmd") then
          -- npm launchers need cmd.exe even when Neovim uses PowerShell.
          tools[name] = { cmd = { "cmd.exe", "/d", "/c", name .. ".cmd" } }
        end
      end
    end
    return { nes = { enabled = false }, cli = { tools = tools } }
  end,
  keys = {
    {
      "<leader>i",
      function() require("sidekick.cli").select({ filter = { installed = true } }) end,
      desc = "Select AI CLI",
    },
    { "<leader>i", draft_for_selection, mode = "x", desc = "AI actions for selected text" },
  },
}
