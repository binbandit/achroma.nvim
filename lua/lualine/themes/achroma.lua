-- Lualine theme for achroma.nvim

local colors = {
  black = "#000000",
  gray0 = "#0d0d0d",
  gray1 = "#1e1e1e",
  gray2 = "#282828",
  gray3 = "#3c3c3c",
  gray4 = "#505050",
  gray5 = "#656565",
  gray6 = "#7a7a7a",
  gray7 = "#8f8f8f",
  gray8 = "#a4a4a4",
  gray9 = "#b8b8b8",
  gray10 = "#cccccc",
  gray11 = "#e0e0e0",
  gray12 = "#f4f4f4",
}

local achroma = {}

-- Determine colors based on background and variant
local bg = vim.o.background
local variant = vim.g.achroma_variant or "default"
local c = {}

if bg == "dark" then
  c.bg = variant == "black" and colors.black or colors.gray1
  c.bg_highlight = variant == "black" and colors.gray1 or colors.gray2
  c.bg_statusline = variant == "black" and colors.gray1 or colors.gray2
  c.fg = colors.gray11
  c.fg_dark = colors.gray9
  c.syntax1 = colors.gray10
  c.syntax2 = colors.gray12
  c.syntax3 = colors.gray8
  c.error = colors.gray7
else
  c.bg = colors.gray12
  c.bg_highlight = colors.gray11
  c.bg_statusline = colors.gray11
  c.fg = colors.gray1
  c.fg_dark = colors.gray3
  c.syntax1 = colors.gray4
  c.syntax2 = colors.gray0
  c.syntax3 = colors.gray2
  c.error = colors.gray5
end

achroma.normal = {
  a = { bg = c.fg, fg = c.bg, gui = 'bold' },
  b = { bg = c.bg_highlight, fg = c.fg },
  c = { bg = c.bg_statusline, fg = c.fg_dark }
}

achroma.insert = {
  a = { bg = c.syntax1, fg = c.bg, gui = 'bold' },
  b = { bg = c.bg_highlight, fg = c.syntax1 },
  c = { bg = c.bg_statusline, fg = c.fg_dark }
}

achroma.visual = {
  a = { bg = c.syntax3, fg = c.bg, gui = 'bold' },
  b = { bg = c.bg_highlight, fg = c.syntax3 },
  c = { bg = c.bg_statusline, fg = c.fg_dark }
}

achroma.replace = {
  a = { bg = c.error, fg = c.bg, gui = 'bold' },
  b = { bg = c.bg_highlight, fg = c.error },
  c = { bg = c.bg_statusline, fg = c.fg_dark }
}

achroma.command = {
  a = { bg = c.syntax2, fg = c.bg, gui = 'bold' },
  b = { bg = c.bg_highlight, fg = c.syntax2 },
  c = { bg = c.bg_statusline, fg = c.fg_dark }
}

achroma.inactive = {
  a = { bg = c.bg_statusline, fg = c.fg_dark },
  b = { bg = c.bg_statusline, fg = c.fg_dark },
  c = { bg = c.bg_statusline, fg = c.fg_dark }
}

return achroma