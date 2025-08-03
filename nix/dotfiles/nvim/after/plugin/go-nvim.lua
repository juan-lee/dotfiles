require('go').setup({
  dap_debug = false,
  dap_debug_keymap = false,
  dap_debug_gui = false,
  dap_debug_vt = false,
})

local function go_build()
  local save_makeprg = vim.opt_local.makeprg
  vim.opt_local.makeprg = 'go build . errors'
  vim.api.nvim_command('make')
  vim.opt_local.makeprg = save_makeprg
end

vim.api.nvim_create_user_command('GolangBuild', go_build, { nargs = 0 })
