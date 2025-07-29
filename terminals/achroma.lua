-- WezTerm configuration for Achroma colorscheme
-- Add this to your wezterm.lua configuration

local achroma_dark = {
  foreground = "#e0e0e0",
  background = "#1e1e1e",
  cursor_bg = "#e0e0e0",
  cursor_fg = "#1e1e1e",
  cursor_border = "#e0e0e0",
  selection_fg = "#e0e0e0",
  selection_bg = "#3c3c3c",
  scrollbar_thumb = "#505050",
  split = "#3c3c3c",

  ansi = {
    "#1e1e1e", -- black
    "#8f8f8f", -- red
    "#cccccc", -- green
    "#a4a4a4", -- yellow
    "#808080", -- blue
    "#f4f4f4", -- magenta
    "#989898", -- cyan
    "#e0e0e0", -- white
  },

  brights = {
    "#505050", -- bright black
    "#8f8f8f", -- bright red
    "#b8b8b8", -- bright green
    "#a4a4a4", -- bright yellow
    "#808080", -- bright blue
    "#f4f4f4", -- bright magenta
    "#989898", -- bright cyan
    "#e0e0e0", -- bright white
  },
}

local achroma_black = {
  foreground = "#e0e0e0",
  background = "#000000",
  cursor_bg = "#e0e0e0",
  cursor_fg = "#000000",
  cursor_border = "#e0e0e0",
  selection_fg = "#e0e0e0",
  selection_bg = "#282828",
  scrollbar_thumb = "#3c3c3c",
  split = "#282828",

  ansi = {
    "#000000", -- black
    "#8f8f8f", -- red
    "#cccccc", -- green
    "#a4a4a4", -- yellow
    "#808080", -- blue
    "#f4f4f4", -- magenta
    "#989898", -- cyan
    "#e0e0e0", -- white
  },

  brights = {
    "#3c3c3c", -- bright black
    "#8f8f8f", -- bright red
    "#b8b8b8", -- bright green
    "#a4a4a4", -- bright yellow
    "#808080", -- bright blue
    "#f4f4f4", -- bright magenta
    "#989898", -- bright cyan
    "#e0e0e0", -- bright white
  },
}

local achroma_light = {
  foreground = "#1e1e1e",
  background = "#f4f4f4",
  cursor_bg = "#1e1e1e",
  cursor_fg = "#f4f4f4",
  cursor_border = "#1e1e1e",
  selection_fg = "#1e1e1e",
  selection_bg = "#cccccc",
  scrollbar_thumb = "#b8b8b8",
  split = "#cccccc",

  ansi = {
    "#f4f4f4", -- black
    "#656565", -- red
    "#505050", -- green
    "#656565", -- yellow
    "#282828", -- blue
    "#0d0d0d", -- magenta
    "#3c3c3c", -- cyan
    "#1e1e1e", -- white
  },

  brights = {
    "#cccccc", -- bright black
    "#656565", -- bright red
    "#3c3c3c", -- bright green
    "#656565", -- bright yellow
    "#282828", -- bright blue
    "#0d0d0d", -- bright magenta
    "#3c3c3c", -- bright cyan
    "#1e1e1e", -- bright white
  },
}

return {
  dark = achroma_dark,
  black = achroma_black,
  light = achroma_light,
}