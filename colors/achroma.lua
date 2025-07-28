-- achroma.lua - Main theme file
-- This file is loaded when the colorscheme is applied

vim.cmd([[set background=dark]])

require('achroma').setup({
  mode = vim.o.background
})