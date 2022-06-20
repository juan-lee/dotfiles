require('telescope').setup{
    defaults = {},
    pickers = {
        live_grep = {
            glob_pattern = "!*_test.go"
        }
    },
    extensions = {}
}
