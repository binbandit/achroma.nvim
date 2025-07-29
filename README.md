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

### Commands

```vim
:Achroma dark        " Dark mode
:Achroma light       " Light mode
:Achroma black       " Pure black background (dark mode)
:Achroma dark black  " Explicit dark mode with black background
```

### Configuration

```lua
require('achroma').setup({
  mode = 'dark',     -- 'dark' or 'light'
  variant = 'black'  -- 'default' or 'black' (dark mode only)
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
- WCAG compliant contrast ratios
- Full Tree-sitter support
- LSP diagnostics styling

### Plugin Support

The theme includes highlight groups for:

**File Management**: NvimTree, NeoTree  
**Completion**: nvim-cmp, blink.cmp  
**Search**: Telescope  
**Git Integration**: GitSigns, Diffview  
**UI Enhancement**: Bufferline, lualine, Noice, Notify, WhichKey  
**Development Tools**: Lazy, Mason, Trouble, TodoComments  
**Navigation**: Flash, Hop  
**Startup**: Alpha, Dashboard  
**Indentation**: IndentBlankline

## Philosophy

Achroma removes color as a distraction, using only shades of gray to create visual hierarchy. This approach reduces cognitive load and helps maintain focus on the code structure rather than syntax highlighting.

## Contributing

Issues and pull requests are welcome. When contributing, please ensure all color combinations maintain WCAG AA compliance for accessibility.

## License

MIT