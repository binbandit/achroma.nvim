-- achroma.nvim - Plugin initialization

-- Create vim commands for the theme
vim.api.nvim_create_user_command('Achroma', function(opts)
  local args = vim.split(opts.args or '', ' ')
  local options = {
    mode = vim.o.background,
    variant = 'default',
    transparent = false
  }
  
  -- Parse arguments
  for _, arg in ipairs(args) do
    if arg == 'dark' or arg == 'light' then
      options.mode = arg
    elseif arg == 'black' or arg == 'default' then
      options.variant = arg
    elseif arg == 'transparent' then
      options.transparent = true
    end
  end
  
  require('achroma').setup(options)
end, {
  nargs = '*',
  complete = function(arg_lead, cmd_line, cursor_pos)
    return { 'dark', 'light', 'black', 'default', 'transparent' }
  end,
  desc = 'Set achroma colorscheme with optional mode and variant'
})