require("dap-go").setup()

vim.keymap.set("n", "<leader>dt", "<Cmd>lua require'dap-go'.debug_test()<CR>")

