require("telescope").setup {
    defaults = {
        color_devicons = true,
        path_display = { "smart" },
        layout_strategy = "flex",
        layout_config = {
            flex = {
                height = 0.95,
                width = 0.95,
                flip_columns = 150,
            },
        },
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

vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sb', require('telescope').extensions.file_browser.file_browser, { desc = '[S]earch File [B]rowser' })
