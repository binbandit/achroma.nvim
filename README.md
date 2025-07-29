# achroma.nvim

A minimalist grayscale colorscheme for Neovim with no color distractions.

## Overview

Achroma is a purely grayscale theme designed for focused coding. It supports both light and dark modes, includes a pure black variant for OLED displays, and ensures all colors meet WCAG accessibility standards.

## Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):
```lua
{
  "binbandit/achroma.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme "achroma"
  end,
}
```

Using [packer.nvim](https://github.com/wbthomason/packer.nvim):
```lua
use {
  "binbandit/achroma.nvim",
  config = function()
    vim.cmd.colorscheme "achroma"
  end
}
```

## Usage

Basic usage:
```vim
colorscheme achroma
```

Or with Lua configuration:
```lua
require('achroma').setup({
  mode = 'dark',           -- 'dark' or 'light'
  variant = 'default',     -- 'default' or 'black' (dark mode only)
  transparent = false,     -- true for transparent background
  pop = false,             -- true for subtle color accents
  inverse_popup = false,   -- true for high contrast popup menus
  auto_dark_light = false, -- true to follow system dark/light mode
  adaptive_contrast = false, -- true to adjust contrast based on time of day
  git_gutter_colors = false, -- true for colored git gutter symbols
  highlight_scope = false    -- true to highlight current scope
})
```

### Commands

```vim
:Achroma dark              " Dark mode
:Achroma light             " Light mode
:Achroma black             " Pure black background (dark mode)
:Achroma transparent       " Transparent background
:Achroma dark black        " Dark mode with black background
:Achroma dark transparent  " Dark mode with transparent background
```

### Configuration

```lua
require('achroma').setup({
  mode = 'dark',          -- 'dark' or 'light'
  variant = 'black',      -- 'default' or 'black' (dark mode only)
  transparent = false,    -- true for transparent background
  inverse_popup = false,  -- true for high contrast popup menus
  auto_dark_light = false, -- true to follow system dark/light mode
  adaptive_contrast = false, -- true to adjust contrast based on time
  contrast_schedule = {      -- customize time-based contrast
    morning = "normal",      -- 6am-12pm
    afternoon = "high",      -- 12pm-6pm  
    evening = "soft",        -- 6pm-10pm
    night = "ultra_soft"     -- 10pm-6am
  },
  git_gutter_colors = false, -- true for colored git symbols
  highlight_scope = false    -- true to highlight current scope
})
```

#### Configuration Options

**`inverse_popup`**: Provides high contrast selection in completion menus
- **Dark mode**: White background with black text for selected items
- **Light mode**: Black background with white text for selected items

**`auto_dark_light`**: Automatically switches between dark and light modes
- Follows Neovim's `background` option
- Works with plugins that detect system theme (e.g., [auto-dark-mode.nvim](https://github.com/f-person/auto-dark-mode.nvim))
- Preserves other settings when switching modes

**`adaptive_contrast`**: Smart contrast that adjusts based on time of day
- Reduces eye strain by matching ambient light conditions
- High contrast during bright afternoons
- Softer contrast for evening and late-night coding
- Fully customizable schedule

**`git_gutter_colors`**: Adds color to git gutter symbols
- Green for additions, blue for changes, red for deletions
- Helps quickly identify git changes while maintaining grayscale theme

**`highlight_scope`**: Subtly highlights current scope
- Shows current function/block context
- Helps maintain code location awareness
- Works with vim-illuminate and treesitter-context

The theme respects your existing `background` setting:
```vim
set background=dark  " Use dark mode
set background=light " Use light mode
```

### Lualine Integration

```lua
require('lualine').setup {
  options = {
    theme = 'achroma'
  }
}
```

## Features

### Core
- Pure grayscale palette - no color distractions
- Dark and light mode support
- Pure black variant for OLED displays
- Transparent background support
- WCAG compliant contrast ratios
- Full Tree-sitter support
- LSP diagnostics styling

### Plugin Support

The theme includes highlight groups for:

**File Management**: NvimTree, NeoTree, aerial.nvim  
**Completion**: nvim-cmp, blink.cmp, mini.completion  
**Search**: Telescope  
**Git Integration**: GitSigns, Diffview  
**UI Enhancement**: Bufferline, barbar.nvim, lualine, Noice, Notify, WhichKey, mini.statusline, mini.tabline  
**Development Tools**: Lazy, Mason, Trouble, TodoComments, nvim-dap, nvim-dap-ui  
**Navigation**: Flash, Hop, leap.nvim, mini.jump, vim-illuminate, vim-matchup  
**Startup**: Alpha, Dashboard, mini.starter  
**Indentation**: IndentBlankline, indent-blankline.nvim v3, mini.indentscope  
**Breadcrumbs**: nvim-navic  
**Syntax**: rainbow-delimiters.nvim, headlines.nvim  
**LSP Enhancement**: LspSaga  
**Testing**: mini.test

## Philosophy

Achroma removes color as a distraction, using only shades of gray to create visual hierarchy. This approach reduces cognitive load and helps maintain focus on the code structure rather than syntax highlighting.

## Colorblind-Friendly Design

Achroma is the first truly colorblind-friendly Neovim theme. By using only grayscale:
- **100% accessible** to all types of color vision deficiency
- **No color confusion** between error, warning, and info highlights
- **Consistent experience** for all developers regardless of color perception
- **Pattern-based differentiation** using underlines, bold, and italic styles

Perfect for teams with diverse visual needs or developers who want to ensure their code is readable by everyone.

## Accessibility

All color combinations in achroma.nvim are designed to meet WCAG AA standards for contrast ratios:
- Normal text: 7:1 minimum contrast ratio
- Large text: 4.5:1 minimum contrast ratio
- The lightest gray used for comments (#8f8f8f) against dark backgrounds meets AA standards
- Error highlighting has been adjusted to #8f8f8f for improved visibility while maintaining the grayscale aesthetic

## Contributing

Issues and pull requests are welcome. When contributing, please ensure all color combinations maintain WCAG AA compliance for accessibility.

## Terminal Themes

Achroma includes matching terminal color schemes for popular terminal emulators. Find them in the `terminals/` directory:

### iTerm2
1. Download `terminals/achroma-dark.itermcolors`
2. Open iTerm2 Preferences → Profiles → Colors
3. Click "Color Presets" → "Import" and select the file

### WezTerm
Add to your `wezterm.lua`:
```lua
local achroma = require("path/to/achroma.nvim/terminals/achroma")
config.color_scheme = achroma.dark -- or achroma.black or achroma.light
```

### Ghostty
Copy `terminals/achroma` to `~/.config/ghostty/themes/` and add to your config:
```
theme = achroma
```

### Alacritty
Add the contents of `terminals/achroma.toml` to your `alacritty.toml` configuration.

### Kitty
Include in your `kitty.conf`:
```
include path/to/achroma.nvim/terminals/achroma.conf
```

### Windows Terminal
1. Copy the contents of `terminals/achroma.json` (or `achroma-black.json`, `achroma-light.json`)
2. Add to the `schemes` array in Windows Terminal settings

## License

MIT