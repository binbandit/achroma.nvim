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
  mode = 'dark',       -- 'dark' or 'light'
  variant = 'default', -- 'default' or 'black' (dark mode only)
  transparent = false, -- true for transparent background
  pop = false          -- true for subtle color accents
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
  mode = 'dark',       -- 'dark' or 'light'
  variant = 'black',   -- 'default' or 'black' (dark mode only)
  transparent = false  -- true for transparent background
})
```

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
**UI Enhancement**: Bufferline, lualine, Noice, Notify, WhichKey, mini.statusline, mini.tabline  
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

## Accessibility

All color combinations in achroma.nvim are designed to meet WCAG AA standards for contrast ratios:
- Normal text: 7:1 minimum contrast ratio
- Large text: 4.5:1 minimum contrast ratio
- The lightest gray used for comments (#8f8f8f) against dark backgrounds meets AA standards
- Error highlighting has been adjusted to #8f8f8f for improved visibility while maintaining the grayscale aesthetic

## Contributing

Issues and pull requests are welcome. When contributing, please ensure all color combinations maintain WCAG AA compliance for accessibility.

## License

MIT