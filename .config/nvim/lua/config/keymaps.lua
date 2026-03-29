-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set
-- helper function to get dynamic position
local function get_terminal_position()
  return vim.o.columns > 200 and "right" or "bottom"
end

-- floating terminal
map("n", "<leader>ft", function() Snacks.terminal(nil, { win = { position = get_terminal_position() } }) end, { desc = "Terminal (cwd)" })
map("n", "<leader>fT", function() Snacks.terminal(nil, { cwd = LazyVim.root(), win = { position = get_terminal_position() }}) end, { desc = "Terminal (Root Dir)" })
map("n", "<c-/>", function() Snacks.terminal(nil, { win = { position = get_terminal_position() } }) end, { desc = "Terminal (cwd)" })
map("n", "<c-_>", function() Snacks.terminal(nil, { win = { position = get_terminal_position() } }) end, { desc = "which_key_ignore" })
