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
