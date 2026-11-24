local dap = require("dap")
local ui = require("dapui")
ui.setup()

dap.listeners.after.event_initialized.ui = function() ui.open() end
dap.listeners.before.event_terminated.ui = function() ui.close() end
dap.listeners.before.event_exited.ui = function() ui.close() end

vim.keymap.set("n", "<F5>", function()
  if not dap.session() and vim.bo.filetype == "rust" and vim.fn.exists(":RustLsp") == 2 then
    vim.cmd.RustLsp("debuggables")
  else
    dap.continue()
  end
end, { desc = "Start or continue debugging" })
vim.keymap.set("n", "<F9>", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Step over" })
vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Step into" })
vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Step out" })
vim.keymap.set("n", "<S-F5>", dap.terminate, { desc = "Stop debugging" })
vim.keymap.set("n", "<leader>du", ui.toggle, { desc = "Toggle debugger panels" })
