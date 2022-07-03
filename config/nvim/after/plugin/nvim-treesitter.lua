require("nvim-treesitter.configs").setup {
    ensure_installed = { "bash", "dockerfile", "go", "gomod", "json", "lua", "vim", "yaml" },
    sync_install = false,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    refactor = {
        highlight_definitions = {
            enable = true,
            -- Set to false if you have an `updatetime` of ~100.
            clear_on_cursor_move = true,
        },
    },
    textobjects = {
        enable = true,
        lsp_interop = {
            enable = true,
            peek_definition_code = {
                -- ["<leader>df"] = "@function.outer",
                -- ["<leader>dF"] = "@class.outer",
            }
        },
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            },
        },
        move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
                ["]]"] = "@function.outer",
            },
            goto_previous_start = {
                ["[["] = "@function.outer",
            },
        },
    },
}

require("treesitter-context").setup {
    enable = true,
    max_lines = 0,
    trim_scope = 'outer',
    patterns = {
        default = {
            'function',
        },
    },
    exact_patterns = {},
    zindex = 20,
    mode = 'cursor',
}
