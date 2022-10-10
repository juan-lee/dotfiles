vim.keymap.set("n", "<F5>", "<Cmd>lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<F17>", "<Cmd>lua require'dap'.terminate()<CR>") -- F17 is S-F5
vim.keymap.set("n", "<F9>", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<F10>", "<Cmd>lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<F11>", "<Cmd>lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<F23>", "<Cmd>lua require'dap'.step_out()<CR>") -- F23 is S-F11
