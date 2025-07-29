# achroma.nvim

A minimal grayscale colorscheme for Neovim that supports both light and dark modes.

## Features

- Pure grayscale palette with no color distractions
- Support for dark and light modes
- Pure black background variant for OLED displays
- Full support for Tree-sitter highlighting
- LSP diagnostics support
- WCAG compliant color contrasts
- Extensive plugin support:
  - File explorers: NvimTree, NeoTree
  - Completion: nvim-cmp, blink.cmp
  - Search: Telescope
  - Git: GitSigns, Diffview
  - UI: Bufferline, lualine, Noice, Notify, WhichKey
  - Utilities: Lazy, Mason, Trouble, TodoComments
  - Navigation: Flash, Hop
  - Start screens: Alpha, Dashboard
  - Indentation: IndentBlankline

## Installation

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "binbandit/achroma.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme achroma]])
  end,
}
```

### Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "binbandit/achroma.nvim",
  config = function()
    vim.cmd([[colorscheme achroma]])
  end
}
```

## Usage

```vim
" Set the colorscheme
colorscheme achroma

" Or with a specific mode
:Achroma dark
:Achroma light

" Use pure black background variant
:Achroma black
:Achroma dark black
:Achroma light  " Light mode doesn't have black variant
```

### Configuration

```lua
-- Set up with options
require('achroma').setup({
  mode = 'dark',     -- 'dark' or 'light'
  variant = 'black'  -- 'default' or 'black' (dark mode only)
})
```

The theme automatically respects your `background` setting:

```vim
set background=dark  " Use dark mode
set background=light " Use light mode
```

### Lualine Configuration

To use the achroma theme with lualine:

```lua
require('lualine').setup {
  options = {
    theme = 'achroma'
  }
}
```

## License

MIT