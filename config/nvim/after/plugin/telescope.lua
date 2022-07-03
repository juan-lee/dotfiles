require("telescope").setup{
    defaults = {
        color_devicons = true,
    },
    pickers = {
        live_grep = {
            glob_pattern = "!*_test.go"
        }
    },
    extensions = {
        file_browser = {
            theme = "ivy",
            hijack_netrw = false,
            mappings = {
                ["i"] = {
                },
                ["n"] = {
                },
            },
        },
    },
}

require("telescope").load_extension "file_browser"

-- telescope
vim.keymap.set("n", "<leader>t", "<Cmd>Telescope find_files<CR>")
vim.keymap.set("n", "<leader>g", "<Cmd>Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>G", "<Cmd>Telescope grep_string<CR>")
vim.keymap.set("n", "<leader>u", "<Cmd>Telescope buffers<CR>")
vim.keymap.set("n", "<leader>-", "<Cmd>Telescope file_browser<CR>")
