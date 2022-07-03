--[[

./plugin/*.lua
    Per-plugin configuration that needs to run before package load

./after/plugin/*.lua
    Per-plugin configuration

./lua/settings.lua
    Global configuration

./lua/mappings.lua
    Global keymappings

./lua/packages.lua
    Package management using packer.nvim
    

--]]
require("settings")
require("mappings")
require("packages")
