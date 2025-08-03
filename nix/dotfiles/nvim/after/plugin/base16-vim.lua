local fn = vim.fn
local cmd = vim.cmd
local set_theme_path = "$HOME/.config/tinted-theming/set_theme.lua"
local is_set_theme_file_readable = fn.filereadable(fn.expand(set_theme_path)) == 1 and true or false

if is_set_theme_file_readable then
  vim.o.termguicolors = true
  vim.g.tinted_colorspace = 256
  cmd("source " .. set_theme_path)
end
