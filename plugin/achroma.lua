-- achroma.nvim - Plugin initialization

-- Create vim commands for the theme
vim.api.nvim_create_user_command('Achroma', function(opts)
  local args = vim.split(opts.args or '', ' ')
  local mode = args[1] or vim.o.background
  local variant = args[2] or 'default'
  
  -- If only one arg is given and it's "black" or "default", treat it as variant
  if #args == 1 and (args[1] == 'black' or args[1] == 'default') then
    variant = args[1]
    mode = vim.o.background
  end
  
  require('achroma').setup({ mode = mode, variant = variant })
end, {
  nargs = '*',
  complete = function(arg_lead, cmd_line, cursor_pos)
    local args = vim.split(cmd_line:sub(8), ' ')  -- Skip 'Achroma '
    if #args <= 1 then
      return { 'dark', 'light', 'black', 'default' }
    elseif #args == 2 then
      return { 'black', 'default' }
    end
    return {}
  end,
  desc = 'Set achroma colorscheme with optional mode and variant'
})