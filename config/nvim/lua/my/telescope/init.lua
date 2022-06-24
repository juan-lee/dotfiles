require("telescope").setup{
    defaults = {
        color_devicons = false,
    },
    pickers = {
        live_grep = {
            glob_pattern = "!*_test.go"
        }
    },
    extensions = {
        file_browser = {
            dir_icon = " ",
            theme = "ivy",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
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

