-- achroma.nvim - Plugin initialization

-- Create vim commands for the theme
vim.api.nvim_create_user_command('Achroma', function(opts)
  local mode = opts.args or vim.o.background
  require('achroma').setup({ mode = mode })
end, {
  nargs = '?',
  complete = function()
    return { 'dark', 'light' }
  end,
  desc = 'Set achroma colorscheme with optional mode'
})