local achroma = {}

local grays = {
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

-- Secret pop mode colors - subtle and sophisticated
local pop_colors = {
  purple = "#9d7cd8",      -- Rich purple for special elements
  red = "#f7768e",         -- Soft red for errors
  yellow = "#e0af68",      -- Warm yellow for warnings
  green = "#9ece6a",       -- Soft green for success/info
  blue = "#7aa2f7",        -- Calm blue for hints
  cyan = "#7dcfff",        -- Bright cyan for special highlights
}

function achroma.setup(opts)
  opts = opts or {}
  local mode = opts.mode or vim.o.background or "dark"
  local variant = opts.variant or "default"
  local transparent = opts.transparent or false
  local pop = opts.pop or false
  local inverse_popup = opts.inverse_popup or false
  local auto_dark_light = opts.auto_dark_light or false
  local p = {}

  if mode == "dark" then
    p.bg = variant == "black" and grays.black or grays.gray1
    p.bg_highlight = variant == "black" and grays.gray1 or grays.gray2
    p.bg_popup = variant == "black" and grays.black or grays.gray0
    p.bg_statusline = variant == "black" and grays.gray1 or grays.gray2
    p.fg = grays.gray11
    p.fg_dark = grays.gray9
    p.fg_gutter = grays.gray6
    p.border = grays.gray3
    p.comment = grays.gray7
    p.syntax1 = pop and pop_colors.green or grays.gray10 -- e.g., strings, numbers
    p.syntax2 = pop and pop_colors.purple or grays.gray12 -- e.g., keywords
    p.syntax3 = pop and pop_colors.blue or grays.gray8 -- e.g., functions
    p.error = pop and pop_colors.red or grays.gray8
    p.warning = pop and pop_colors.yellow or grays.gray8
    p.info = pop and pop_colors.green or grays.gray9
    p.hint = pop and pop_colors.cyan or grays.gray10
    p.none = "NONE"
  elseif mode == "light" then
    p.bg = grays.gray12
    p.bg_highlight = grays.gray11
    p.bg_popup = grays.gray12
    p.bg_statusline = grays.gray11
    p.fg = grays.gray1
    p.fg_dark = grays.gray3
    p.fg_gutter = grays.gray6
    p.border = grays.gray9
    p.comment = grays.gray5
    p.syntax1 = pop and pop_colors.green or grays.gray4 -- e.g., strings, numbers
    p.syntax2 = pop and pop_colors.purple or grays.gray0 -- e.g., keywords
    p.syntax3 = pop and pop_colors.blue or grays.gray2 -- e.g., functions
    p.error = pop and pop_colors.red or grays.gray5
    p.warning = pop and pop_colors.yellow or grays.gray5
    p.info = pop and pop_colors.green or grays.gray4
    p.hint = pop and pop_colors.cyan or grays.gray3
    p.none = "NONE"
  end

  -- Apply transparent background if requested
  if transparent then
    p.bg = "NONE"
    p.bg_popup = "NONE"
    p.bg_statusline = "NONE"
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
  h.Search = { fg = p.bg, bg = pop and pop_colors.purple or p.syntax3 }
  h.IncSearch = { fg = p.bg, bg = pop and pop_colors.cyan or p.syntax2, bold = true }
  h.Substitute = { fg = p.bg, bg = pop and pop_colors.cyan or p.syntax2, bold = true }
  h.SpecialKey = { fg = p.syntax2 }
  h.EndOfBuffer = { fg = p.bg }
  h.Visual = { fg = p.fg, bg = p.border }
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
  if inverse_popup then
    if mode == "dark" then
      h.PmenuSel = { fg = grays.black, bg = grays.gray11 }
    else
      h.PmenuSel = { fg = grays.gray12, bg = grays.black }
    end
  else
    h.PmenuSel = { fg = p.bg, bg = p.fg }
  end
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
  h["@comment"] = { link = "Comment" }
  h["@comment.note"] = { link = "TodoSignNOTE" }
  h["@comment.todo"] = { link = "TodoSignTODO" }
  h["@comment.warning"] = { link = "TodoSignWARN" }
  h["@comment.error"] = { link = "TodoSignERROR" }
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

  -- IndentBlankline
  h.IndentBlanklineChar = { fg = p.fg_gutter, nocombine = true }
  h.IndentBlanklineSpaceChar = { fg = p.fg_gutter, nocombine = true }
  h.IndentBlanklineContextChar = { fg = p.syntax2, nocombine = true }
  h.IndentBlanklineContextStart = { underline = true, sp = p.syntax2 }
  h.IndentBlanklineIndent1 = { fg = grays.gray3, nocombine = true }
  h.IndentBlanklineIndent2 = { fg = grays.gray4, nocombine = true }
  h.IndentBlanklineIndent3 = { fg = grays.gray5, nocombine = true }
  h.IndentBlanklineIndent4 = { fg = grays.gray6, nocombine = true }
  h.IndentBlanklineIndent5 = { fg = grays.gray7, nocombine = true }
  h.IndentBlanklineIndent6 = { fg = grays.gray8, nocombine = true }
  h.IndentBlanklineIndent7 = { fg = grays.gray9, nocombine = true }
  h.IndentBlanklineIndent8 = { fg = grays.gray10, nocombine = true }

  -- NeoTree
  h.NeoTreeNormal = { fg = p.fg, bg = p.bg }
  h.NeoTreeNormalNC = { fg = p.fg, bg = p.bg }
  h.NeoTreeDirectoryName = { fg = p.syntax3 }
  h.NeoTreeDirectoryIcon = { fg = p.syntax3 }
  h.NeoTreeFileName = { fg = p.fg }
  h.NeoTreeIndentMarker = { fg = p.fg_gutter }
  h.NeoTreeExpander = { fg = p.fg_gutter }
  h.NeoTreeModified = { fg = p.warning }
  h.NeoTreeGitAdded = { fg = p.syntax1 }
  h.NeoTreeGitDeleted = { fg = p.error }
  h.NeoTreeGitModified = { fg = p.warning }

  -- Bufferline
  h.BufferLineFill = { bg = p.bg }
  h.BufferLineBackground = { fg = p.fg_dark, bg = p.bg_highlight }
  h.BufferLineBufferVisible = { fg = p.fg, bg = p.bg }
  h.BufferLineBufferSelected = { fg = p.fg, bg = p.bg, bold = true }
  h.BufferLineTabSelected = { fg = p.fg, bg = p.bg }
  h.BufferLineTabClose = { fg = p.error, bg = p.bg_highlight }
  h.BufferLineIndicatorSelected = { fg = p.bg, bg = p.bg }
  h.BufferLineCloseButtonSelected = { fg = p.error, bg = p.bg }
  h.BufferLineModifiedSelected = { fg = p.warning, bg = p.bg }
  h.BufferLineError = { fg = p.error, bg = p.bg_highlight }
  h.BufferLineWarning = { fg = p.warning, bg = p.bg_highlight }

  -- Barbar
  h.BarbarBufferVisible = { fg = p.fg, bg = p.bg_highlight }
  h.BarbarBufferCurrent = { fg = p.fg, bg = p.bg, bold = true }
  h.BarbarBufferInactive = { fg = p.fg_dark, bg = p.bg_statusline }
  h.BarbarBufferTab = { fg = p.fg_gutter, bg = p.bg }

  -- TodoComments
  h.TodoBgTODO = { fg = p.bg, bg = p.info, bold = true }
  h.TodoFgTODO = { fg = p.info }
  h.TodoSignTODO = { fg = p.info }
  h.TodoBgWARN = { fg = p.bg, bg = p.warning, bold = true }
  h.TodoFgWARN = { fg = p.warning }
  h.TodoSignWARN = { fg = p.warning }
  h.TodoBgERROR = { fg = p.bg, bg = p.error, bold = true }
  h.TodoFgERROR = { fg = p.error }
  h.TodoSignERROR = { fg = p.error }
  h.TodoBgNOTE = { fg = p.bg, bg = p.hint, bold = true }
  h.TodoFgNOTE = { fg = p.hint }
  h.TodoSignNOTE = { fg = p.hint }
  h.TodoBgPERF = { fg = p.bg, bg = p.syntax3, bold = true }
  h.TodoFgPERF = { fg = p.syntax3 }
  h.TodoSignPERF = { fg = p.syntax3 }
  h.TodoBgHACK = { fg = p.bg, bg = p.syntax2, bold = true }
  h.TodoFgHACK = { fg = p.syntax2 }
  h.TodoSignHACK = { fg = p.syntax2 }
  h.TodoBgFIX = { fg = p.bg, bg = p.error, bold = true }
  h.TodoFgFIX = { fg = p.error }
  h.TodoSignFIX = { fg = p.error }

  -- Flash
  h.FlashBackdrop = { fg = p.fg_gutter }
  h.FlashMatch = { fg = p.fg, bg = p.bg_highlight }
  h.FlashCurrent = { fg = p.fg, bg = p.syntax1 }
  h.FlashLabel = { fg = p.bg, bg = p.syntax2, bold = true }
  h.FlashPrompt = { fg = p.fg, bg = p.bg_popup }

  -- Alpha
  h.AlphaHeader = { fg = p.syntax2 }
  h.AlphaButtons = { fg = p.syntax3 }
  h.AlphaFooter = { fg = p.comment }
  h.AlphaShortcut = { fg = p.syntax1 }

  -- Hop
  h.HopNextKey = { fg = p.syntax2, bold = true }
  h.HopNextKey1 = { fg = p.syntax3, bold = true }
  h.HopNextKey2 = { fg = p.syntax1 }
  h.HopUnmatched = { fg = p.comment }

  -- Diffview
  h.DiffviewNormal = { fg = p.fg, bg = p.bg }
  h.DiffviewCursorLine = { bg = p.bg_highlight }
  h.DiffviewFilePanelInsertion = { fg = p.syntax1 }
  h.DiffviewFilePanelDeletion = { fg = p.error }
  h.DiffviewFilePanelSelected = { fg = p.fg, bold = true }
  h.DiffviewFilePanelFileName = { fg = p.fg }
  h.DiffviewFilePanelTitle = { fg = p.syntax2, bold = true }
  h.DiffviewFilePanelCounter = { fg = p.syntax1, bold = true }
  h.DiffviewFolderSign = { fg = p.syntax3 }
  h.DiffviewStatusLine = { fg = p.fg, bg = p.bg_statusline }

  -- Lualine
  h.lualine_a_normal = { fg = p.bg, bg = p.fg }
  h.lualine_b_normal = { fg = p.fg, bg = p.bg_highlight }
  h.lualine_c_normal = { fg = p.fg_dark, bg = p.bg_statusline }
  h.lualine_a_insert = { fg = p.bg, bg = p.syntax1 }
  h.lualine_b_insert = { fg = p.syntax1, bg = p.bg_highlight }
  h.lualine_a_visual = { fg = p.bg, bg = p.syntax3 }
  h.lualine_b_visual = { fg = p.syntax3, bg = p.bg_highlight }
  h.lualine_a_replace = { fg = p.bg, bg = p.error }
  h.lualine_b_replace = { fg = p.error, bg = p.bg_highlight }
  h.lualine_a_command = { fg = p.bg, bg = p.syntax2 }
  h.lualine_b_command = { fg = p.syntax2, bg = p.bg_highlight }
  h.lualine_a_inactive = { fg = p.fg_dark, bg = p.bg_statusline }
  h.lualine_b_inactive = { fg = p.fg_dark, bg = p.bg_statusline }
  h.lualine_c_inactive = { fg = p.fg_dark, bg = p.bg_statusline }
  
  -- Additional Lualine groups
  h.LualineNormalA = { fg = p.bg, bg = p.syntax2, bold = true }
  h.LualineNormalB = { fg = p.fg, bg = p.bg_statusline }
  h.LualineNormalC = { fg = p.fg_dark, bg = p.bg }
  h.LualineInsertA = { fg = p.bg, bg = p.syntax1, bold = true }
  h.LualineVisualA = { fg = p.bg, bg = p.syntax3, bold = true }
  h.LualineReplaceA = { fg = p.bg, bg = p.error, bold = true }
  h.LualineCommandA = { fg = p.bg, bg = p.warning, bold = true }
  h.LualineInactiveA = { fg = p.fg_gutter, bg = p.bg_highlight }

  -- Blink.cmp
  h.BlinkCmpMenu = { fg = p.fg, bg = p.bg_popup }
  h.BlinkCmpMenuBorder = { fg = p.border, bg = p.bg_popup }
  if inverse_popup then
    if mode == "dark" then
      h.BlinkCmpMenuSelection = { fg = grays.black, bg = grays.gray11 }
    else
      h.BlinkCmpMenuSelection = { fg = grays.gray12, bg = grays.black }
    end
  else
    h.BlinkCmpMenuSelection = { fg = p.fg, bg = p.bg_highlight }
  end
  h.BlinkCmpLabel = { fg = p.fg }
  h.BlinkCmpLabelDeprecated = { fg = p.comment, strikethrough = true }
  h.BlinkCmpLabelMatch = { fg = p.syntax3, bold = true }
  h.BlinkCmpLabelDetail = { fg = p.comment }
  h.BlinkCmpLabelDescription = { fg = p.fg_dark }
  h.BlinkCmpKind = { fg = p.syntax2 }
  h.BlinkCmpKindText = { fg = p.fg_dark }
  h.BlinkCmpKindMethod = { fg = p.syntax3 }
  h.BlinkCmpKindFunction = { fg = p.syntax3 }
  h.BlinkCmpKindConstructor = { fg = p.syntax2 }
  h.BlinkCmpKindField = { fg = p.fg_dark }
  h.BlinkCmpKindVariable = { fg = p.fg }
  h.BlinkCmpKindClass = { fg = p.syntax2 }
  h.BlinkCmpKindInterface = { fg = p.syntax2 }
  h.BlinkCmpKindModule = { fg = p.syntax2 }
  h.BlinkCmpKindProperty = { fg = p.fg_dark }
  h.BlinkCmpKindUnit = { fg = p.syntax1 }
  h.BlinkCmpKindValue = { fg = p.syntax1 }
  h.BlinkCmpKindEnum = { fg = p.syntax1 }
  h.BlinkCmpKindKeyword = { fg = p.syntax2 }
  h.BlinkCmpKindSnippet = { fg = p.syntax3 }
  h.BlinkCmpKindColor = { fg = p.syntax1 }
  h.BlinkCmpKindFile = { fg = p.fg }
  h.BlinkCmpKindReference = { fg = p.fg_dark }
  h.BlinkCmpKindFolder = { fg = p.syntax3 }
  h.BlinkCmpKindEnumMember = { fg = p.syntax1 }
  h.BlinkCmpKindConstant = { fg = p.syntax1 }
  h.BlinkCmpKindStruct = { fg = p.syntax2 }
  h.BlinkCmpKindEvent = { fg = p.syntax3 }
  h.BlinkCmpKindOperator = { fg = p.fg }
  h.BlinkCmpKindTypeParameter = { fg = p.syntax2 }
  h.BlinkCmpSource = { fg = p.comment }
  h.BlinkCmpGhostText = { fg = p.comment }
  h.BlinkCmpDoc = { fg = p.fg, bg = p.bg_popup }
  h.BlinkCmpDocBorder = { fg = p.border, bg = p.bg_popup }
  h.BlinkCmpDocCursorLine = { bg = p.bg_highlight }
  h.BlinkCmpSignatureHelp = { fg = p.fg, bg = p.bg_popup }
  h.BlinkCmpSignatureHelpBorder = { fg = p.border, bg = p.bg_popup }
  h.BlinkCmpSignatureHelpActiveParameter = { fg = p.syntax3, bold = true }

  -- mini.nvim suite
  h.MiniCompletionActiveParameter = { underline = true }
  h.MiniCursorword = { bg = p.bg_highlight }
  h.MiniCursorwordCurrent = { bg = p.bg_highlight }
  h.MiniIndentscopeSymbol = { fg = p.fg_gutter }
  h.MiniIndentscopePrefix = { nocombine = true }
  h.MiniJump = { fg = p.bg, bg = p.syntax2 }
  h.MiniJump2dSpot = { fg = p.syntax2, bold = true }
  h.MiniStarterCurrent = { nocombine = true }
  h.MiniStarterFooter = { fg = p.comment }
  h.MiniStarterHeader = { fg = p.syntax2 }
  h.MiniStarterInactive = { fg = p.comment }
  h.MiniStarterItem = { fg = p.fg, bg = p.bg }
  h.MiniStarterItemBullet = { fg = p.syntax2 }
  h.MiniStarterItemPrefix = { fg = p.warning }
  h.MiniStarterSection = { fg = p.syntax3 }
  h.MiniStarterQuery = { fg = p.info }
  h.MiniStatuslineDevinfo = { fg = p.fg_dark, bg = p.bg_statusline }
  h.MiniStatuslineFileinfo = { fg = p.fg_dark, bg = p.bg_statusline }
  h.MiniStatuslineFilename = { fg = p.fg_dark, bg = p.bg_statusline }
  h.MiniStatuslineInactive = { fg = p.comment, bg = p.bg_statusline }
  h.MiniStatuslineModeCommand = { fg = p.bg, bg = p.syntax2, bold = true }
  h.MiniStatuslineModeInsert = { fg = p.bg, bg = p.syntax1, bold = true }
  h.MiniStatuslineModeNormal = { fg = p.bg, bg = p.fg, bold = true }
  h.MiniStatuslineModeOther = { fg = p.bg, bg = p.comment, bold = true }
  h.MiniStatuslineModeReplace = { fg = p.bg, bg = p.error, bold = true }
  h.MiniStatuslineModeVisual = { fg = p.bg, bg = p.syntax3, bold = true }
  h.MiniSurround = { bg = p.warning }
  h.MiniTablineCurrent = { fg = p.fg, bg = p.bg }
  h.MiniTablineFill = { bg = p.bg }
  h.MiniTablineHidden = { fg = p.fg_dark, bg = p.bg_statusline }
  h.MiniTablineModifiedCurrent = { fg = p.warning, bg = p.bg }
  h.MiniTablineModifiedHidden = { fg = p.warning, bg = p.bg_statusline }
  h.MiniTablineModifiedVisible = { fg = p.warning, bg = p.bg_statusline }
  h.MiniTablineTabpagesection = { bg = p.bg_statusline }
  h.MiniTablineVisible = { fg = p.fg, bg = p.bg_statusline }
  h.MiniTestEmphasis = { bold = true }
  h.MiniTestFail = { fg = p.error, bold = true }
  h.MiniTestPass = { fg = p.syntax1, bold = true }
  h.MiniTrailspace = { bg = p.error }

  -- vim-illuminate
  h.IlluminatedWordText = { bg = p.bg_highlight }
  h.IlluminatedWordRead = { bg = p.bg_highlight }
  h.IlluminatedWordWrite = { bg = p.bg_highlight }

  -- indent-blankline.nvim v3
  h.IblIndent = { fg = p.fg_gutter, nocombine = true }
  h.IblScope = { fg = p.syntax2, nocombine = true }

  -- nvim-navic
  h.NavicIconsFile = { fg = p.fg }
  h.NavicIconsModule = { fg = p.syntax2 }
  h.NavicIconsNamespace = { fg = p.syntax3 }
  h.NavicIconsPackage = { fg = p.fg }
  h.NavicIconsClass = { fg = p.syntax2 }
  h.NavicIconsMethod = { fg = p.syntax3 }
  h.NavicIconsProperty = { fg = p.fg_dark }
  h.NavicIconsField = { fg = p.fg_dark }
  h.NavicIconsConstructor = { fg = p.syntax2 }
  h.NavicIconsEnum = { fg = p.syntax1 }
  h.NavicIconsInterface = { fg = p.syntax2 }
  h.NavicIconsFunction = { fg = p.syntax3 }
  h.NavicIconsVariable = { fg = p.fg }
  h.NavicIconsConstant = { fg = p.syntax1 }
  h.NavicIconsString = { fg = p.syntax1 }
  h.NavicIconsNumber = { fg = p.syntax1 }
  h.NavicIconsBoolean = { fg = p.syntax1 }
  h.NavicIconsArray = { fg = p.fg }
  h.NavicIconsObject = { fg = p.fg }
  h.NavicIconsKey = { fg = p.syntax2 }
  h.NavicIconsKeyword = { fg = p.syntax2 }
  h.NavicIconsNull = { fg = p.syntax1 }
  h.NavicIconsEnumMember = { fg = p.syntax1 }
  h.NavicIconsStruct = { fg = p.syntax2 }
  h.NavicIconsEvent = { fg = p.syntax3 }
  h.NavicIconsOperator = { fg = p.fg }
  h.NavicIconsTypeParameter = { fg = p.syntax2 }
  h.NavicText = { fg = p.fg }
  h.NavicSeparator = { fg = p.fg_dark }

  -- aerial.nvim
  h.AerialNormal = { fg = p.fg, bg = p.bg }
  h.AerialGuide = { fg = p.fg_gutter }
  h.AerialLine = { bg = p.bg_highlight }
  h.AerialLineNC = { bg = p.bg_highlight }

  -- nvim-dap
  h.DapBreakpoint = { fg = p.error }
  h.DapBreakpointCondition = { fg = p.warning }
  h.DapBreakpointRejected = { fg = p.comment }
  h.DapLogPoint = { fg = p.info }
  h.DapStopped = { fg = p.syntax1 }

  -- nvim-dap-ui
  h.DapUIVariable = { fg = p.fg }
  h.DapUIScope = { fg = p.syntax3 }
  h.DapUIType = { fg = p.syntax2 }
  h.DapUIValue = { fg = p.fg }
  h.DapUIModifiedValue = { fg = p.syntax3, bold = true }
  h.DapUIDecoration = { fg = p.syntax3 }
  h.DapUIThread = { fg = p.syntax1 }
  h.DapUIStoppedThread = { fg = p.syntax3 }
  h.DapUIFrameName = { fg = p.fg }
  h.DapUISource = { fg = p.syntax2 }
  h.DapUILineNumber = { fg = p.syntax3 }
  h.DapUIFloatBorder = { fg = p.border }
  h.DapUIWatchesEmpty = { fg = p.error }
  h.DapUIWatchesValue = { fg = p.syntax1 }
  h.DapUIWatchesError = { fg = p.error }
  h.DapUIBreakpointsPath = { fg = p.syntax3 }
  h.DapUIBreakpointsInfo = { fg = p.syntax1 }
  h.DapUIBreakpointsCurrentLine = { fg = p.syntax1, bold = true }
  h.DapUIBreakpointsLine = { fg = p.fg }
  h.DapUIBreakpointsDisabledLine = { fg = p.comment }

  -- leap.nvim
  h.LeapMatch = { fg = p.bg, bg = p.syntax2, bold = true }
  h.LeapLabelPrimary = { fg = p.bg, bg = p.syntax2, bold = true }
  h.LeapLabelSecondary = { fg = p.bg, bg = p.syntax3, bold = true }
  h.LeapBackdrop = { fg = p.comment }

  -- nvim-notify
  h.NotifyERRORBorder = { fg = p.error }
  h.NotifyWARNBorder = { fg = p.warning }
  h.NotifyINFOBorder = { fg = p.info }
  h.NotifyDEBUGBorder = { fg = p.comment }
  h.NotifyTRACEBorder = { fg = p.syntax2 }
  h.NotifyERRORIcon = { fg = p.error }
  h.NotifyWARNIcon = { fg = p.warning }
  h.NotifyINFOIcon = { fg = p.info }
  h.NotifyDEBUGIcon = { fg = p.comment }
  h.NotifyTRACEIcon = { fg = p.syntax2 }
  h.NotifyERRORTitle = { fg = p.error }
  h.NotifyWARNTitle = { fg = p.warning }
  h.NotifyINFOTitle = { fg = p.info }
  h.NotifyDEBUGTitle = { fg = p.comment }
  h.NotifyTRACETitle = { fg = p.syntax2 }
  h.NotifyERRORBody = { fg = p.fg }
  h.NotifyWARNBody = { fg = p.fg }
  h.NotifyINFOBody = { fg = p.fg }
  h.NotifyDEBUGBody = { fg = p.fg }
  h.NotifyTRACEBody = { fg = p.fg }

  -- vim-matchup
  h.MatchWord = { bg = p.bg_highlight, underline = true }
  h.MatchParen = { bg = p.bg_highlight }
  h.MatchWordCur = { bg = p.bg_highlight, underline = true }
  h.MatchParenCur = { bg = p.bg_highlight, underline = true }

  -- headlines.nvim
  h.Headline1 = { bg = p.bg_highlight }
  h.Headline2 = { bg = p.bg_highlight }
  h.Headline3 = { bg = p.bg_highlight }
  h.CodeBlock = { bg = p.bg_highlight }
  h.Dash = { fg = p.fg_gutter }

  -- rainbow-delimiters.nvim
  h.RainbowDelimiterRed = { fg = p.fg }
  h.RainbowDelimiterYellow = { fg = p.fg_dark }
  h.RainbowDelimiterBlue = { fg = p.syntax3 }
  h.RainbowDelimiterOrange = { fg = p.syntax1 }
  h.RainbowDelimiterGreen = { fg = p.syntax2 }
  h.RainbowDelimiterViolet = { fg = p.comment }
  h.RainbowDelimiterCyan = { fg = p.info }

  -- LspSaga
  h.SagaBorder = { fg = p.border }
  h.SagaNormal = { fg = p.fg, bg = p.bg_popup }
  h.SagaExpanded = { fg = p.syntax3 }
  h.SagaCollapsed = { fg = p.syntax3 }
  h.SagaBeacon = { bg = p.syntax2 }
  h.ActionPreviewTitle = { fg = p.syntax2, bg = p.bg_popup }
  h.CodeActionText = { fg = p.fg }
  h.CodeActionNumber = { fg = p.syntax1 }
  h.FinderSelection = { fg = p.syntax3, bg = p.bg_highlight }
  h.FinderFileName = { fg = p.fg }
  h.FinderCount = { fg = p.comment }
  h.FinderIcon = { fg = p.syntax2 }
  h.FinderType = { fg = p.syntax2 }
  h.FinderSpinnerTitle = { fg = p.syntax2, bold = true }
  h.FinderSpinner = { fg = p.syntax2, bold = true }
  h.DefinitionIcon = { fg = p.syntax3 }
  h.DefinitionPreviewTitle = { fg = p.syntax2, bold = true }
  h.HoverNormal = { fg = p.fg, bg = p.bg_popup }
  h.HoverBorder = { fg = p.border, bg = p.bg_popup }
  h.RenameBorder = { fg = p.border }
  h.RenameNormal = { fg = p.fg, bg = p.bg_popup }
  h.DiagnosticBorder = { fg = p.border }
  h.DiagnosticSource = { fg = p.comment }
  h.DiagnosticNormal = { fg = p.fg, bg = p.bg_popup }
  h.DiagnosticErrorTitle = { fg = p.error }
  h.DiagnosticWarnTitle = { fg = p.warning }
  h.DiagnosticInfoTitle = { fg = p.info }
  h.DiagnosticHintTitle = { fg = p.hint }
  h.DiagnosticPos = { fg = p.comment }
  h.LspSagaCodeActionTitle = { fg = p.syntax2 }
  h.LspSagaCodeActionBorder = { fg = p.border }
  h.LspSagaCodeActionContent = { fg = p.fg }
  h.LspSagaLspFinderBorder = { fg = p.border }
  h.LspSagaAutoPreview = { fg = p.syntax3 }
  h.LspSagaFinderSelection = { fg = p.syntax3, bg = p.bg_highlight }
  h.LspFloatWinNormal = { bg = p.bg_popup }
  h.LspFloatWinBorder = { fg = p.border }

  vim.cmd.highlight("clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  vim.g.colors_name = "achroma"
  vim.g.achroma_variant = variant
  vim.g.achroma_pop = pop
  vim.g.achroma_inverse_popup = inverse_popup
  vim.g.achroma_auto_dark_light = auto_dark_light

  for group, settings in pairs(h) do
    vim.api.nvim_set_hl(0, group, settings)
  end

  -- Set up autocmd for dynamic theme switching
  if auto_dark_light then
    vim.api.nvim_create_augroup("AchromaAutoTheme", { clear = true })
    vim.api.nvim_create_autocmd("OptionSet", {
      group = "AchromaAutoTheme",
      pattern = "background",
      callback = function()
        -- Preserve user options
        local saved_opts = {
          variant = vim.g.achroma_variant,
          transparent = transparent,
          pop = vim.g.achroma_pop,
          inverse_popup = vim.g.achroma_inverse_popup,
          auto_dark_light = true
        }
        -- Update mode based on new background
        saved_opts.mode = vim.o.background
        -- Reapply theme with new mode
        achroma.setup(saved_opts)
      end,
    })
  end
end

return achroma