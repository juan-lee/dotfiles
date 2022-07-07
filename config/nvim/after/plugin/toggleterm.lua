require("toggleterm").setup {
    open_mapping = [[<leader>\]],
    insert_mappings = false,
    direction = "horizontal",
    size = function(term)
        if term.direction == "horizontal" then
            return vim.o.lines * 0.5
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.5
        end
    end,
    float_opts = {
        border = "curved",
    }
}
