local achroma = {}

local grays = {
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

function achroma.setup(opts)
  opts = opts or {}
  local mode = opts.mode or "dark"
  local p = {}

  if mode == "dark" then
    p.bg = grays.gray1
    p.bg_highlight = grays.gray2
    p.bg_popup = grays.gray0
    p.bg_statusline = grays.gray2
    p.fg = grays.gray11
    p.fg_dark = grays.gray9
    p.fg_gutter = grays.gray4
    p.border = grays.gray3
    p.comment = grays.gray7
    p.syntax1 = grays.gray10 -- e.g., strings, numbers
    p.syntax2 = grays.gray12 -- e.g., keywords
    p.syntax3 = grays.gray8 -- e.g., functions
    p.error = grays.gray6
    p.warning = grays.gray8
    p.info = grays.gray9
    p.hint = grays.gray10
    p.none = "NONE"
  elseif mode == "light" then
    p.bg = grays.gray12
    p.bg_highlight = grays.gray11
    p.bg_popup = grays.gray12
    p.bg_statusline = grays.gray11
    p.fg = grays.gray1
    p.fg_dark = grays.gray3
    p.fg_gutter = grays.gray8
    p.border = grays.gray9
    p.comment = grays.gray5
    p.syntax1 = grays.gray4 -- e.g., strings, numbers
    p.syntax2 = grays.gray0 -- e.g., keywords
    p.syntax3 = grays.gray2 -- e.g., functions
    p.error = grays.gray6
    p.warning = grays.gray5
    p.info = grays.gray4
    p.hint = grays.gray3
    p.none = "NONE"
  end

  local h = {}

  -- Standard highlight groups
  h.Normal = { fg = p.fg, bg = p.bg }
  h.Cursor = { fg = p.bg, bg = p.fg }
  h.CursorLine = { bg = p.bg_highlight }
  h.CursorColumn = { bg = p.bg_highlight }
  h.CursorLineNr = { fg = p.fg, bold = true }
  h.LineNr = { fg = p.fg_gutter }
  h.SignColumn = { bg = p.bg }
  h.StatusLine = { fg = p.fg, bg = p.bg_statusline }
  h.StatusLineNC = { fg = p.fg_dark, bg = p.bg_statusline }
  h.VertSplit = { fg = p.border, bg = p.bg }
  h.ColorColumn = { bg = p.bg_highlight }
  h.Directory = { fg = p.syntax3 }
  h.MsgArea = { fg = p.fg_dark }
  h.ModeMsg = { fg = p.fg, bold = true }
  h.MoreMsg = { fg = p.syntax1, bold = true }
  h.NonText = { fg = p.fg_gutter }
  h.Question = { fg = p.warning }
  h.Search = { fg = p.bg, bg = p.fg }
  h.IncSearch = { fg = p.bg, bg = p.fg, bold = true }
  h.Substitute = { fg = p.bg, bg = p.fg, bold = true }
  h.SpecialKey = { fg = p.syntax2 }
  h.EndOfBuffer = { fg = p.bg }
  h.Visual = { bg = p.bg_highlight }
  h.WarningMsg = { fg = p.warning }
  h.ErrorMsg = { fg = p.error }
  h.Error = { fg = p.error }
  h.Exception = { fg = p.error }
  h.Folded = { fg = p.comment, bg = p.bg_highlight }
  h.FoldColumn = { fg = p.fg_gutter }
  h.TabLine = { fg = p.fg_dark, bg = p.bg_highlight }
  h.TabLineSel = { fg = p.fg, bg = p.bg }
  h.TabLineFill = { bg = p.bg }
  h.Title = { fg = p.syntax2, bold = true }
  h.Pmenu = { fg = p.fg, bg = p.bg_popup }
  h.PmenuSel = { fg = p.bg, bg = p.fg }
  h.PmenuSbar = { bg = p.bg_highlight }
  h.PmenuThumb = { bg = p.fg_gutter }
  h.WildMenu = { fg = p.fg, bg = p.bg_highlight }
  h.QuickFixLine = { bg = p.bg_highlight }
  h.DiffAdd = { fg = p.syntax1, bg = p.bg }
  h.DiffChange = { fg = p.syntax3, bg = p.bg }
  h.DiffDelete = { fg = p.error, bg = p.bg }
  h.DiffText = { fg = p.fg, bg = p.bg }
  h.SpellBad = { undercurl = true, sp = p.error }
  h.SpellCap = { undercurl = true, sp = p.warning }
  h.SpellLocal = { undercurl = true, sp = p.info }
  h.SpellRare = { undercurl = true, sp = p.hint }

  -- Syntax highlight groups
  h.Comment = { fg = p.comment, italic = true }
  h.Constant = { fg = p.syntax1 }
  h.String = { fg = p.syntax1, italic = true }
  h.Character = { fg = p.syntax1 }
  h.Number = { fg = p.syntax1 }
  h.Boolean = { fg = p.syntax1 }
  h.Float = { fg = p.syntax1 }
  h.Identifier = { fg = p.fg }
  h.Function = { fg = p.syntax3 }
  h.Statement = { fg = p.syntax2 }
  h.Conditional = { fg = p.syntax2 }
  h.Repeat = { fg = p.syntax2 }
  h.Label = { fg = p.syntax2 }
  h.Operator = { fg = p.fg }
  h.Keyword = { fg = p.syntax2, bold = true }
  h.Include = { fg = p.syntax2 }
  h.Define = { fg = p.syntax2 }
  h.Macro = { fg = p.syntax2 }
  h.PreProc = { fg = p.syntax2 }
  h.PreCondit = { fg = p.syntax2 }
  h.Type = { fg = p.syntax2 }
  h.StorageClass = { fg = p.syntax2 }
  h.Structure = { fg = p.syntax2 }
  h.Typedef = { fg = p.syntax2 }
  h.Special = { fg = p.syntax3 }
  h.SpecialChar = { fg = p.syntax3 }
  h.Tag = { fg = p.syntax3 }
  h.Delimiter = { fg = p.fg_dark }
  h.SpecialComment = { fg = p.comment }
  h.Debug = { fg = p.warning }
  h.Underlined = { underline = true }
  h.Ignore = { fg = p.fg_gutter }
  h.Todo = { fg = p.info, bold = true }

  -- Tree-sitter highlight groups
  h["@error"] = { fg = p.error }
  h["@punctuation.delimiter"] = { fg = p.fg_dark }
  h["@punctuation.bracket"] = { fg = p.fg_dark }
  h["@punctuation.special"] = { fg = p.syntax3 }
  h["@constant"] = { fg = p.syntax1 }
  h["@constant.builtin"] = { fg = p.syntax1 }
  h["@constant.macro"] = { fg = p.syntax2 }
  h["@string"] = { fg = p.syntax1, italic = true }
  h["@string.regex"] = { fg = p.syntax1 }
  h["@string.escape"] = { fg = p.syntax3 }
  h["@character"] = { fg = p.syntax1 }
  h["@number"] = { fg = p.syntax1 }
  h["@boolean"] = { fg = p.syntax1 }
  h["@float"] = { fg = p.syntax1 }
  h["@function"] = { fg = p.syntax3 }
  h["@function.builtin"] = { fg = p.syntax3 }
  h["@function.macro"] = { fg = p.syntax3 }
  h["@method"] = { fg = p.syntax3 }
  h["@constructor"] = { fg = p.syntax2 }
  h["@parameter"] = { fg = p.fg_dark, italic = true }
  h["@variable"] = { fg = p.fg }
  h["@variable.builtin"] = { fg = p.syntax2 }
  h["@type"] = { fg = p.syntax2 }
  h["@type.builtin"] = { fg = p.syntax2 }
  h["@type.qualifier"] = { fg = p.syntax2 }
  h["@attribute"] = { fg = p.syntax2 }
  h["@property"] = { fg = p.fg_dark }
  h["@field"] = { fg = p.fg_dark }
  h["@keyword"] = { fg = p.syntax2, bold = true }
  h["@keyword.operator"] = { fg = p.syntax2 }
  h["@operator"] = { fg = p.fg }
  h["@exception"] = { fg = p.error }
  h["@include"] = { fg = p.syntax2 }
  h["@label"] = { fg = p.syntax2 }
  h["@namespace"] = { fg = p.syntax3 }
  h["@symbol"] = { fg = p.syntax1 }
  h["@text"] = { fg = p.fg }
  h["@text.title"] = { fg = p.syntax2, bold = true }
  h["@text.literal"] = { fg = p.syntax1 }
  h["@text.uri"] = { underline = true }
  h["@text.reference"] = { fg = p.syntax3 }
  h["@tag"] = { fg = p.syntax3 }
  h["@tag.attribute"] = { fg = p.fg_dark }
  h["@tag.delimiter"] = { fg = p.fg_dark }

  -- LSP highlight groups
  h.DiagnosticError = { fg = p.error }
  h.DiagnosticWarn = { fg = p.warning }
  h.DiagnosticInfo = { fg = p.info }
  h.DiagnosticHint = { fg = p.hint }
  h.DiagnosticVirtualTextError = { fg = p.error }
  h.DiagnosticVirtualTextWarn = { fg = p.warning }
  h.DiagnosticVirtualTextInfo = { fg = p.info }
  h.DiagnosticVirtualTextHint = { fg = p.hint }
  h.DiagnosticUnderlineError = { undercurl = true, sp = p.error }
  h.DiagnosticUnderlineWarn = { undercurl = true, sp = p.warning }
  h.DiagnosticUnderlineInfo = { undercurl = true, sp = p.info }
  h.DiagnosticUnderlineHint = { undercurl = true, sp = p.hint }
  h.LspReferenceText = { bg = p.bg_highlight }
  h.LspReferenceRead = { bg = p.bg_highlight }
  h.LspReferenceWrite = { bg = p.bg_highlight }
  h.LspCodeLens = { fg = p.comment }
  h.LspSignatureActiveParameter = { fg = p.syntax3, bold = true }

  -- Plugin support
  -- Telescope
  h.TelescopeNormal = { fg = p.fg, bg = p.bg_popup }
  h.TelescopeBorder = { fg = p.border, bg = p.bg_popup }
  h.TelescopePromptBorder = { fg = p.border, bg = p.bg_popup }
  h.TelescopeResultsBorder = { fg = p.border, bg = p.bg_popup }
  h.TelescopePreviewBorder = { fg = p.border, bg = p.bg_popup }
  h.TelescopeSelection = { fg = p.fg, bg = p.bg_highlight, bold = true }
  h.TelescopeSelectionCaret = { fg = p.syntax2 }
  h.TelescopeMultiSelection = { fg = p.comment }
  h.TelescopeTitle = { fg = p.fg, bold = true }
  h.TelescopePromptCounter = { fg = p.fg_dark }

  -- NvimTree
  h.NvimTreeNormal = { fg = p.fg, bg = p.bg }
  h.NvimTreeFolderName = { fg = p.syntax3 }
  h.NvimTreeFolderIcon = { fg = p.syntax3 }
  h.NvimTreeOpenedFolderName = { fg = p.syntax3, bold = true }
  h.NvimTreeRootFolder = { fg = p.fg, bold = true }
  h.NvimTreeIndentMarker = { fg = p.fg_gutter }
  h.NvimTreeGitDirty = { fg = p.warning }
  h.NvimTreeGitNew = { fg = p.syntax1 }
  h.NvimTreeGitDeleted = { fg = p.error }
  h.NvimTreeSpecialFile = { fg = p.syntax2 }
  h.NvimTreeImageFile = { fg = p.fg_dark }
  h.NvimTreeSymlink = { fg = p.syntax3 }

  -- CMP
  h.CmpItemAbbr = { fg = p.fg }
  h.CmpItemAbbrDeprecated = { fg = p.comment, strikethrough = true }
  h.CmpItemAbbrMatch = { fg = p.syntax3, bold = true }
  h.CmpItemAbbrMatchFuzzy = { fg = p.syntax3, bold = true }
  h.CmpItemMenu = { fg = p.comment }
  h.CmpItemKindText = { fg = p.fg_dark }
  h.CmpItemKindMethod = { fg = p.syntax3 }
  h.CmpItemKindFunction = { fg = p.syntax3 }
  h.CmpItemKindConstructor = { fg = p.syntax2 }
  h.CmpItemKindField = { fg = p.fg_dark }
  h.CmpItemKindVariable = { fg = p.fg }
  h.CmpItemKindClass = { fg = p.syntax2 }
  h.CmpItemKindInterface = { fg = p.syntax2 }
  h.CmpItemKindModule = { fg = p.syntax2 }
  h.CmpItemKindProperty = { fg = p.fg_dark }
  h.CmpItemKindUnit = { fg = p.syntax1 }
  h.CmpItemKindValue = { fg = p.syntax1 }
  h.CmpItemKindEnum = { fg = p.syntax1 }
  h.CmpItemKindKeyword = { fg = p.syntax2 }
  h.CmpItemKindSnippet = { fg = p.syntax3 }
  h.CmpItemKindColor = { fg = p.syntax1 }
  h.CmpItemKindFile = { fg = p.fg }
  h.CmpItemKindReference = { fg = p.fg_dark }
  h.CmpItemKindFolder = { fg = p.syntax3 }
  h.CmpItemKindEnumMember = { fg = p.syntax1 }
  h.CmpItemKindConstant = { fg = p.syntax1 }
  h.CmpItemKindStruct = { fg = p.syntax2 }
  h.CmpItemKindEvent = { fg = p.syntax3 }
  h.CmpItemKindOperator = { fg = p.fg }
  h.CmpItemKindTypeParameter = { fg = p.syntax2 }

  -- GitSigns
  h.GitSignsAdd = { fg = p.syntax1 }
  h.GitSignsChange = { fg = p.syntax3 }
  h.GitSignsDelete = { fg = p.error }

  -- Trouble
  h.TroubleNormal = { fg = p.fg, bg = p.bg }
  h.TroubleText = { fg = p.fg_dark }
  h.TroubleCount = { fg = p.syntax2, bg = p.bg_highlight }

  -- WhichKey
  h.WhichKey = { fg = p.syntax2 }
  h.WhichKeyGroup = { fg = p.syntax3 }
  h.WhichKeyDesc = { fg = p.fg }
  h.WhichKeySeparator = { fg = p.comment }
  h.WhichKeyFloat = { bg = p.bg_popup }

  -- Lazy
  h.LazyNormal = { fg = p.fg, bg = p.bg_popup }

  -- Mason
  h.MasonNormal = { fg = p.fg, bg = p.bg_popup }

  -- Notify
  h.NotifyBackground = { bg = p.bg_popup }

  -- Noice
  h.NoiceCmdlinePopupBorder = { fg = p.border }
  h.NoiceCmdlineIcon = { fg = p.syntax2 }

  -- Dashboard
  h.DashboardHeader = { fg = p.syntax2 }
  h.DashboardFooter = { fg = p.syntax3 }

  vim.cmd.highlight("clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  vim.g.colors_name = "achroma"

  for group, settings in pairs(h) do
    vim.api.nvim_set_hl(0, group, settings)
  end
end

return achroma