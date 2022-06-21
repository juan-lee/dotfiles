local Path = require "plenary.path"

local vimrc_background_path = Path:new { vim.loop.os_homedir(), ".vimrc_background" }
if vimrc_background_path:exists() then
    vim.cmd "set t_Co=256"
    vim.g.base16colorspace = 256
    vim.cmd "source ~/.vimrc_background"
end
