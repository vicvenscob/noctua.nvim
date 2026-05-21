-- noctua highlights
-- applies all highlight groups from a given palette

local M = {}

function M.apply(p, variant)
  local function hi(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  local is_light = variant == "breakfast"

  -- diff bg colors derived per-variant
  local diff = is_light and {
    add    = "#d4eedd",
    change = "#d4e4f0",
    delete = "#f0d4dc",
    text   = "#c4d8ee",
    add_fg = "#2a7040",
  } or variant == "dinner" and {
    add    = "#1a3020",
    change = "#1e2a30",
    delete = "#381820",
    text   = "#2a3040",
    add_fg = "#88cc88",
  } or {
    add    = "#1e3a2f",
    change = "#1e2a3e",
    delete = "#3a1e2a",
    text   = "#2a3d5a",
    add_fg = "#a6e3a1",
  }

  -- ────────────────────────────────────────────────────────────
  -- Editor chrome
  -- ────────────────────────────────────────────────────────────
  hi("Normal",          { fg = p.fg,        bg = p.bg })
  hi("NormalNC",        { fg = p.fg_dim,    bg = p.bg })
  hi("NormalFloat",     { fg = p.fg,        bg = p.bg2 })
  hi("FloatBorder",     { fg = p.border,    bg = p.bg2 })
  hi("FloatTitle",      { fg = p.lavender,  bg = p.bg2, bold = true })
  hi("ColorColumn",     { bg = p.bg1 })
  hi("CursorLine",      { bg = p.cursorline })
  hi("CursorColumn",    { bg = p.cursorline })
  hi("CursorLineNr",    { fg = p.lavender,  bold = true })
  hi("LineNr",          { fg = p.fg_muted })
  hi("SignColumn",      { fg = p.fg_muted,  bg = p.bg })
  hi("Folded",          { fg = p.fg_muted,  bg = p.bg2 })
  hi("FoldColumn",      { fg = p.border2,   bg = p.bg })
  hi("VertSplit",       { fg = p.border,    bg = p.bg })
  hi("WinSeparator",    { fg = p.border,    bg = p.bg })
  hi("StatusLine",      { fg = p.fg_dim,    bg = p.bg1 })
  hi("StatusLineNC",    { fg = p.fg_muted,  bg = p.bg1 })
  hi("TabLine",         { fg = p.fg_muted,  bg = p.bg1 })
  hi("TabLineSel",      { fg = p.lavender,  bg = p.bg3, bold = true })
  hi("TabLineFill",     { bg = p.bg1 })
  hi("WinBar",          { fg = p.fg_dim,    bg = p.bg })
  hi("WinBarNC",        { fg = p.fg_muted,  bg = p.bg })
  hi("EndOfBuffer",     { fg = p.bg3 })
  hi("NonText",         { fg = p.bg4 })
  hi("SpecialKey",      { fg = p.bg5 })
  hi("Whitespace",      { fg = p.bg4 })
  hi("Conceal",         { fg = p.fg_muted })

  -- ────────────────────────────────────────────────────────────
  -- Cursor & visual
  -- ────────────────────────────────────────────────────────────
  hi("Cursor",          { fg = p.bg,        bg = p.fg })
  hi("lCursor",         { fg = p.bg,        bg = p.fg })
  hi("CursorIM",        { fg = p.bg,        bg = p.fg })
  hi("TermCursor",      { fg = p.bg,        bg = p.cyan })
  hi("Visual",          { bg = p.selection })
  hi("VisualNOS",       { bg = p.selection })
  hi("Search",          { fg = p.bg,        bg = p.yellow })
  hi("CurSearch",       { fg = p.bg,        bg = p.orange })
  hi("IncSearch",       { fg = p.bg,        bg = p.orange })
  hi("Substitute",      { fg = p.bg,        bg = p.red })
  hi("MatchParen",      { fg = p.orange,    bold = true, underline = true })

  -- ────────────────────────────────────────────────────────────
  -- Popup / menu
  -- ────────────────────────────────────────────────────────────
  hi("Pmenu",           { fg = p.fg,        bg = p.bg2 })
  hi("PmenuSel",        { fg = p.bg,        bg = p.blue })
  hi("PmenuSbar",       { bg = p.bg3 })
  hi("PmenuThumb",      { bg = p.border2 })
  hi("WildMenu",        { fg = p.bg,        bg = p.blue })

  -- ────────────────────────────────────────────────────────────
  -- Messages / prompts
  -- ────────────────────────────────────────────────────────────
  hi("ModeMsg",         { fg = p.fg_dim,    bold = true })
  hi("MsgArea",         { fg = p.fg_dim })
  hi("MoreMsg",         { fg = p.blue })
  hi("Question",        { fg = p.mauve })
  hi("Title",           { fg = p.blue,      bold = true })
  hi("ErrorMsg",        { fg = p.red })
  hi("WarningMsg",      { fg = p.yellow })

  -- ────────────────────────────────────────────────────────────
  -- Diffs
  -- ────────────────────────────────────────────────────────────
  hi("DiffAdd",         { bg = diff.add })
  hi("DiffChange",      { bg = diff.change })
  hi("DiffDelete",      { bg = diff.delete })
  hi("DiffText",        { bg = diff.text })
  hi("Added",           { fg = p.green })
  hi("Changed",         { fg = p.blue })
  hi("Removed",         { fg = p.red })

  -- ────────────────────────────────────────────────────────────
  -- Diagnostics
  -- ────────────────────────────────────────────────────────────
  hi("DiagnosticError",            { fg = p.red })
  hi("DiagnosticWarn",             { fg = p.yellow })
  hi("DiagnosticInfo",             { fg = p.blue })
  hi("DiagnosticHint",             { fg = p.teal })
  hi("DiagnosticOk",               { fg = p.green })
  hi("DiagnosticUnderlineError",   { sp = p.red,    undercurl = true })
  hi("DiagnosticUnderlineWarn",    { sp = p.yellow, undercurl = true })
  hi("DiagnosticUnderlineInfo",    { sp = p.blue,   undercurl = true })
  hi("DiagnosticUnderlineHint",    { sp = p.teal,   undercurl = true })
  hi("DiagnosticVirtualTextError", { fg = p.red,    bg = p.bg2, italic = true })
  hi("DiagnosticVirtualTextWarn",  { fg = p.yellow, bg = p.bg2, italic = true })
  hi("DiagnosticVirtualTextInfo",  { fg = p.blue,   bg = p.bg2, italic = true })
  hi("DiagnosticVirtualTextHint",  { fg = p.teal,   bg = p.bg2, italic = true })
  hi("DiagnosticFloatingError",    { fg = p.red })
  hi("DiagnosticFloatingWarn",     { fg = p.yellow })
  hi("DiagnosticFloatingInfo",     { fg = p.blue })
  hi("DiagnosticFloatingHint",     { fg = p.teal })
  hi("DiagnosticSignError",        { fg = p.red })
  hi("DiagnosticSignWarn",         { fg = p.yellow })
  hi("DiagnosticSignInfo",         { fg = p.blue })
  hi("DiagnosticSignHint",         { fg = p.teal })

  -- ────────────────────────────────────────────────────────────
  -- Spelling
  -- ────────────────────────────────────────────────────────────
  hi("SpellBad",        { sp = p.red,    undercurl = true })
  hi("SpellCap",        { sp = p.yellow, undercurl = true })
  hi("SpellRare",       { sp = p.cyan,   undercurl = true })
  hi("SpellLocal",      { sp = p.teal,   undercurl = true })

  -- ────────────────────────────────────────────────────────────
  -- Syntax
  -- ────────────────────────────────────────────────────────────
  hi("Comment",         { fg = p.fg_muted, italic = true })
  hi("Constant",        { fg = p.peach })
  hi("String",          { fg = p.green })
  hi("Character",       { fg = p.teal })
  hi("Number",          { fg = p.peach })
  hi("Boolean",         { fg = p.mauve })
  hi("Float",           { fg = p.peach })
  hi("Identifier",      { fg = p.fg })
  hi("Function",        { fg = p.blue })
  hi("Statement",       { fg = p.mauve })
  hi("Conditional",     { fg = p.mauve })
  hi("Repeat",          { fg = p.mauve })
  hi("Label",           { fg = p.purple })
  hi("Operator",        { fg = p.cyan })
  hi("Keyword",         { fg = p.purple,  italic = true })
  hi("Exception",       { fg = p.red })
  hi("PreProc",         { fg = p.cyan })
  hi("Include",         { fg = p.lavender })
  hi("Define",          { fg = p.purple })
  hi("Macro",           { fg = p.cyan })
  hi("PreCondit",       { fg = p.cyan })
  hi("Type",            { fg = p.sapphire })
  hi("StorageClass",    { fg = p.purple,  italic = true })
  hi("Structure",       { fg = p.sapphire })
  hi("Typedef",         { fg = p.sapphire })
  hi("Special",         { fg = p.orange })
  hi("SpecialChar",     { fg = p.orange })
  hi("Tag",             { fg = p.blue })
  hi("Delimiter",       { fg = p.fg_dim })
  hi("SpecialComment",  { fg = p.fg_muted, bold = true })
  hi("Debug",           { fg = p.red })
  hi("Underlined",      { underline = true })
  hi("Error",           { fg = p.red })
  hi("Todo",            { fg = p.bg,       bg = p.mauve, bold = true })

  -- ────────────────────────────────────────────────────────────
  -- Treesitter
  -- ────────────────────────────────────────────────────────────
  hi("@comment",                    { link = "Comment" })
  hi("@comment.documentation",      { fg = p.fg_muted, italic = true })
  hi("@keyword",                    { link = "Keyword" })
  hi("@keyword.function",           { fg = p.purple,   italic = true })
  hi("@keyword.operator",           { fg = p.cyan })
  hi("@keyword.return",             { fg = p.mauve,    italic = true })
  hi("@keyword.import",             { fg = p.lavender })
  hi("@keyword.modifier",           { fg = p.purple,   italic = true })
  hi("@keyword.coroutine",          { fg = p.mauve })
  hi("@function",                   { fg = p.blue })
  hi("@function.builtin",           { fg = p.cyan })
  hi("@function.macro",             { fg = p.cyan })
  hi("@function.method",            { fg = p.blue })
  hi("@function.method.call",       { fg = p.sapphire })
  hi("@constructor",                { fg = p.sapphire })
  hi("@operator",                   { fg = p.cyan })
  hi("@punctuation.delimiter",      { fg = p.fg_dim })
  hi("@punctuation.bracket",        { fg = p.border2 })
  hi("@punctuation.special",        { fg = p.cyan })
  hi("@variable",                   { fg = p.fg })
  hi("@variable.builtin",           { fg = p.mauve,    italic = true })
  hi("@variable.parameter",         { fg = p.peach })
  hi("@variable.member",            { fg = p.sky })
  hi("@type",                       { fg = p.sapphire })
  hi("@type.builtin",               { fg = p.sapphire, italic = true })
  hi("@type.definition",            { fg = p.sapphire })
  hi("@attribute",                  { fg = p.yellow })
  hi("@property",                   { fg = p.sky })
  hi("@namespace",                  { fg = p.lavender })
  hi("@module",                     { fg = p.lavender })
  hi("@string",                     { link = "String" })
  hi("@string.regex",               { fg = p.orange })
  hi("@string.regexp",              { fg = p.orange })
  hi("@string.escape",              { fg = p.orange })
  hi("@string.special",             { fg = p.orange })
  hi("@string.documentation",       { fg = p.green,    italic = true })
  hi("@number",                     { link = "Number" })
  hi("@number.float",               { link = "Float" })
  hi("@boolean",                    { link = "Boolean" })
  hi("@constant",                   { fg = p.peach })
  hi("@constant.builtin",           { fg = p.orange })
  hi("@constant.macro",             { fg = p.mauve })
  hi("@character",                  { link = "Character" })
  hi("@label",                      { fg = p.purple })
  hi("@tag",                        { fg = p.blue })
  hi("@tag.attribute",              { fg = p.yellow })
  hi("@tag.delimiter",              { fg = p.fg_dim })
  hi("@markup.heading",             { fg = p.blue,     bold = true })
  hi("@markup.heading.1",           { fg = p.blue,     bold = true })
  hi("@markup.heading.2",           { fg = p.mauve,    bold = true })
  hi("@markup.heading.3",           { fg = p.purple,   bold = true })
  hi("@markup.heading.4",           { fg = p.sapphire, bold = true })
  hi("@markup.heading.5",           { fg = p.teal,     bold = true })
  hi("@markup.heading.6",           { fg = p.fg_dim,   bold = true })
  hi("@markup.raw",                 { fg = p.teal })
  hi("@markup.quote",               { fg = p.fg_muted, italic = true })
  hi("@markup.link",                { fg = p.blue,     underline = true })
  hi("@markup.link.url",            { fg = p.cyan,     underline = true })
  hi("@markup.link.label",          { fg = p.lavender })
  hi("@markup.italic",              { italic = true })
  hi("@markup.strong",              { bold = true })
  hi("@markup.strikethrough",       { strikethrough = true })
  hi("@markup.list",                { fg = p.cyan })
  hi("@markup.list.checked",        { fg = p.green })
  hi("@markup.list.unchecked",      { fg = p.fg_muted })
  hi("@diff.plus",                  { link = "Added" })
  hi("@diff.minus",                 { link = "Removed" })
  hi("@diff.delta",                 { link = "Changed" })

  -- ────────────────────────────────────────────────────────────
  -- LSP semantic tokens
  -- ────────────────────────────────────────────────────────────
  hi("@lsp.type.class",             { fg = p.sapphire })
  hi("@lsp.type.decorator",         { fg = p.yellow })
  hi("@lsp.type.enum",              { fg = p.sapphire })
  hi("@lsp.type.enumMember",        { fg = p.peach })
  hi("@lsp.type.function",          { fg = p.blue })
  hi("@lsp.type.interface",         { fg = p.sapphire, italic = true })
  hi("@lsp.type.macro",             { fg = p.cyan })
  hi("@lsp.type.method",            { fg = p.blue })
  hi("@lsp.type.namespace",         { fg = p.lavender })
  hi("@lsp.type.parameter",         { fg = p.peach })
  hi("@lsp.type.property",          { fg = p.sky })
  hi("@lsp.type.struct",            { fg = p.sapphire })
  hi("@lsp.type.type",              { fg = p.sapphire })
  hi("@lsp.type.typeParameter",     { fg = p.sapphire, italic = true })
  hi("@lsp.type.variable",          { fg = p.fg })
  hi("@lsp.type.keyword",           { fg = p.purple,   italic = true })
  hi("@lsp.type.comment",           { fg = p.fg_muted, italic = true })
  hi("@lsp.type.string",            { fg = p.green })
  hi("@lsp.type.number",            { fg = p.peach })
  hi("@lsp.type.operator",          { fg = p.cyan })
  hi("@lsp.mod.readonly",           { fg = p.peach })
  hi("@lsp.mod.deprecated",         { strikethrough = true })
  hi("@lsp.mod.defaultLibrary",     { italic = true })

  -- ────────────────────────────────────────────────────────────
  -- LSP references
  -- ────────────────────────────────────────────────────────────
  hi("LspReferenceText",            { bg = p.bg3, underline = true })
  hi("LspReferenceRead",            { bg = p.bg3, underline = true })
  hi("LspReferenceWrite",           { bg = p.bg3, underline = true, bold = true })
  hi("LspInlayHint",                { fg = p.fg_muted, bg = p.bg2, italic = true })
  hi("LspCodeLens",                 { fg = p.fg_muted, italic = true })
  hi("LspSignatureActiveParameter", { fg = p.peach, underline = true })

  -- ────────────────────────────────────────────────────────────
  -- Telescope
  -- ────────────────────────────────────────────────────────────
  hi("TelescopeNormal",         { fg = p.fg,      bg = p.bg2 })
  hi("TelescopeBorder",         { fg = p.border,  bg = p.bg2 })
  hi("TelescopeTitle",          { fg = p.blue,    bold = true })
  hi("TelescopePromptNormal",   { fg = p.fg,      bg = p.bg3 })
  hi("TelescopePromptBorder",   { fg = p.border2, bg = p.bg3 })
  hi("TelescopePromptTitle",    { fg = p.mauve,   bold = true })
  hi("TelescopePromptPrefix",   { fg = p.mauve })
  hi("TelescopeResultsNormal",  { fg = p.fg,      bg = p.bg2 })
  hi("TelescopeResultsBorder",  { fg = p.border,  bg = p.bg2 })
  hi("TelescopeResultsTitle",   { fg = p.fg_muted })
  hi("TelescopePreviewNormal",  { fg = p.fg,      bg = p.bg1 })
  hi("TelescopePreviewBorder",  { fg = p.border,  bg = p.bg1 })
  hi("TelescopePreviewTitle",   { fg = p.green,   bold = true })
  hi("TelescopeMatching",       { fg = p.blue,    bold = true })
  hi("TelescopeSelection",      { bg = p.selection })
  hi("TelescopeSelectionCaret", { fg = p.mauve })

  -- ────────────────────────────────────────────────────────────
  -- blink.cmp / nvim-cmp
  -- ────────────────────────────────────────────────────────────
  hi("BlinkCmpMenu",              { fg = p.fg,      bg = p.bg2 })
  hi("BlinkCmpMenuBorder",        { fg = p.border,  bg = p.bg2 })
  hi("BlinkCmpMenuSelection",     { bg = p.selection })
  hi("BlinkCmpScrollBarThumb",    { bg = p.border2 })
  hi("BlinkCmpLabel",             { fg = p.fg })
  hi("BlinkCmpLabelMatch",        { fg = p.blue,    bold = true })
  hi("BlinkCmpLabelDeprecated",   { fg = p.fg_muted, strikethrough = true })
  hi("BlinkCmpGhostText",         { fg = p.fg_muted, italic = true })
  hi("BlinkCmpDoc",               { fg = p.fg,      bg = p.bg2 })
  hi("BlinkCmpDocBorder",         { fg = p.border,  bg = p.bg2 })
  hi("BlinkCmpDocSeparator",      { fg = p.border })
  hi("BlinkCmpSignatureHelpBorder",{ fg = p.border, bg = p.bg2 })
  for _, k in ipairs({
    "Function","Method","Constructor","Class","Interface","Struct","Enum",
    "EnumMember","Variable","Field","Property","Module","Keyword","Operator",
    "Snippet","Text","Value","Unit","File","Folder","Color","Reference",
    "Event","TypeParameter",
  }) do
    local color = ({
      Function="blue", Method="blue", Constructor="sapphire", Class="sapphire",
      Interface="sapphire", Struct="sapphire", Enum="sapphire", EnumMember="peach",
      Variable="fg", Field="sky", Property="sky", Module="lavender",
      Keyword="purple", Operator="cyan", Snippet="mauve", Text="green",
      Value="peach", Unit="peach", File="fg_dim", Folder="yellow",
      Color="orange", Reference="lavender", Event="yellow", TypeParameter="sapphire",
    })[k]
    hi("BlinkCmpKind"..k, { fg = p[color] })
    hi("CmpItemKind"..k,  { fg = p[color] })
  end

  -- ────────────────────────────────────────────────────────────
  -- mini.nvim
  -- ────────────────────────────────────────────────────────────
  hi("MiniStatuslineModeNormal",  { fg = p.bg,     bg = p.blue,   bold = true })
  hi("MiniStatuslineModeInsert",  { fg = p.bg,     bg = p.green,  bold = true })
  hi("MiniStatuslineModeVisual",  { fg = p.bg,     bg = p.mauve,  bold = true })
  hi("MiniStatuslineModeReplace", { fg = p.bg,     bg = p.red,    bold = true })
  hi("MiniStatuslineModeCommand", { fg = p.bg,     bg = p.yellow, bold = true })
  hi("MiniStatuslineModeOther",   { fg = p.bg,     bg = p.teal,   bold = true })
  hi("MiniStatuslineDevinfo",     { fg = p.fg_dim, bg = p.bg3 })
  hi("MiniStatuslineFilename",    { fg = p.fg_dim, bg = p.bg2 })
  hi("MiniStatuslineFileinfo",    { fg = p.fg_dim, bg = p.bg3 })
  hi("MiniStatuslineInactive",    { fg = p.fg_muted, bg = p.bg1 })
  hi("MiniTablineCurrent",        { fg = p.lavender, bg = p.bg3, bold = true })
  hi("MiniTablineHidden",         { fg = p.fg_muted, bg = p.bg1 })
  hi("MiniTablineModifiedCurrent",{ fg = p.peach,  bg = p.bg3, bold = true })
  hi("MiniTablineModifiedHidden", { fg = p.peach,  bg = p.bg1 })
  hi("MiniTablineFill",           { bg = p.bg })
  hi("MiniTablineTabpagesection", { fg = p.bg,     bg = p.blue,  bold = true })
  hi("MiniIndentscopeSymbol",     { fg = p.border2 })
  hi("MiniJump",                  { fg = p.bg,     bg = p.orange, bold = true })
  hi("MiniJump2dSpot",            { fg = p.orange, bold = true, underline = true })
  hi("MiniJump2dDim",             { fg = p.fg_muted })
  hi("MiniNotifyNormal",          { fg = p.fg,     bg = p.bg2 })
  hi("MiniNotifyBorder",          { fg = p.border, bg = p.bg2 })
  hi("MiniPickMatchCurrent",      { bg = p.selection })
  hi("MiniPickMatchRanges",       { fg = p.blue,   bold = true })
  hi("MiniPickBorder",            { fg = p.border })
  hi("MiniPickBorderBusy",        { fg = p.yellow })
  hi("MiniPickBorderText",        { fg = p.blue })
  hi("MiniPickPrompt",            { fg = p.mauve })
  hi("MiniCursorword",            { bg = p.bg3 })
  hi("MiniCursorwordCurrent",     { bg = p.bg3 })
  hi("MiniTrailspace",            { bg = p.red })
  hi("MiniStarterSection",        { fg = p.blue,   bold = true })
  hi("MiniStarterItem",           { fg = p.fg,     bg = p.none })
  hi("MiniStarterItemBullet",     { fg = p.border2 })
  hi("MiniStarterItemPrefix",     { fg = p.mauve })
  hi("MiniStarterCurrent",        { bold = true })
  hi("MiniStarterFooter",         { fg = p.fg_muted, italic = true })
  hi("MiniStarterHeader",         { fg = p.blue })
  hi("MiniStarterQuery",          { fg = p.green })
  hi("MiniDiffSignAdd",           { fg = p.green })
  hi("MiniDiffSignChange",        { fg = p.blue })
  hi("MiniDiffSignDelete",        { fg = p.red })
  hi("MiniDiffOverAdd",           { bg = diff.add })
  hi("MiniDiffOverChange",        { bg = diff.change })
  hi("MiniDiffOverDelete",        { bg = diff.delete })
  hi("MiniDiffOverText",          { bg = diff.text })
  hi("MiniDiffOverContext",        { bg = p.bg2 })
  hi("MiniClueDescGroup",         { fg = p.blue,   bold = true })
  hi("MiniClueDescSingle",        { fg = p.fg })
  hi("MiniClueNextKey",           { fg = p.mauve,  bold = true })
  hi("MiniClueNextKeyWithPostkeys",{ fg = p.orange, bold = true })
  hi("MiniClueSeparator",         { fg = p.fg_muted })
  hi("MiniClueTitle",             { fg = p.blue,   bold = true })

  -- ────────────────────────────────────────────────────────────
  -- snacks.nvim
  -- ────────────────────────────────────────────────────────────
  hi("SnacksNormal",             { fg = p.fg,      bg = p.bg2 })
  hi("SnacksBorderNormal",       { fg = p.border,  bg = p.bg2 })
  hi("SnacksBackdrop",           { bg = p.bg,      blend = 60 })
  hi("SnacksPickerInputBorder",  { fg = p.mauve })
  hi("SnacksPickerInputTitle",   { fg = p.mauve,   bold = true })
  hi("SnacksPickerListTitle",    { fg = p.blue,    bold = true })
  hi("SnacksPickerPreviewTitle", { fg = p.green,   bold = true })
  hi("SnacksPickerMatch",        { fg = p.blue,    bold = true })
  hi("SnacksPickerSelected",     { bg = p.selection })
  hi("SnacksDashboardHeader",    { fg = p.blue })
  hi("SnacksDashboardDesc",      { fg = p.fg })
  hi("SnacksDashboardKey",       { fg = p.mauve,   bold = true })
  hi("SnacksDashboardIcon",      { fg = p.lavender })
  hi("SnacksDashboardDir",       { fg = p.fg_muted })
  hi("SnacksDashboardFooter",    { fg = p.fg_muted, italic = true })
  hi("SnacksDashboardTitle",     { fg = p.blue,    bold = true })
  hi("SnacksIndent1",            { fg = p.blue })
  hi("SnacksIndent2",            { fg = p.mauve })
  hi("SnacksIndent3",            { fg = p.purple })
  hi("SnacksIndent4",            { fg = p.teal })
  hi("SnacksIndent5",            { fg = p.cyan })
  hi("SnacksIndent6",            { fg = p.lavender })
  hi("SnacksIndent7",            { fg = p.sky })
  hi("SnacksIndent8",            { fg = p.sapphire })
  hi("SnacksIndentScope",        { fg = p.border2 })
  hi("SnacksNotifierInfo",       { fg = p.blue,    bg = p.bg2 })
  hi("SnacksNotifierWarn",       { fg = p.yellow,  bg = p.bg2 })
  hi("SnacksNotifierError",      { fg = p.red,     bg = p.bg2 })
  hi("SnacksNotifierBorderInfo", { fg = p.blue })
  hi("SnacksNotifierBorderWarn", { fg = p.yellow })
  hi("SnacksNotifierBorderError",{ fg = p.red })
  hi("SnacksNotifierIconInfo",   { fg = p.blue })
  hi("SnacksNotifierIconWarn",   { fg = p.yellow })
  hi("SnacksNotifierIconError",  { fg = p.red })
  hi("SnacksNotifierTitleInfo",  { fg = p.blue,   bold = true })
  hi("SnacksNotifierTitleWarn",  { fg = p.yellow, bold = true })
  hi("SnacksNotifierTitleError", { fg = p.red,    bold = true })
  hi("SnacksWords",              { bg = p.bg3,    underline = true })

  -- ────────────────────────────────────────────────────────────
  -- Git signs
  -- ────────────────────────────────────────────────────────────
  hi("GitSignsAdd",              { fg = p.green })
  hi("GitSignsChange",           { fg = p.blue })
  hi("GitSignsDelete",           { fg = p.red })
  hi("GitSignsAddNr",            { fg = p.green })
  hi("GitSignsChangeNr",         { fg = p.blue })
  hi("GitSignsDeleteNr",         { fg = p.red })
  hi("GitSignsAddLn",            { bg = diff.add })
  hi("GitSignsChangeLn",         { bg = diff.change })
  hi("GitSignsDeleteLn",         { bg = diff.delete })
  hi("GitSignsCurrentLineBlame", { fg = p.fg_muted, italic = true })

  -- ────────────────────────────────────────────────────────────
  -- Mason
  -- ────────────────────────────────────────────────────────────
  hi("MasonNormal",              { fg = p.fg,     bg = p.bg2 })
  hi("MasonHeader",              { fg = p.bg,     bg = p.blue,  bold = true })
  hi("MasonHeaderSecondary",     { fg = p.bg,     bg = p.mauve, bold = true })
  hi("MasonHighlight",           { fg = p.blue })
  hi("MasonHighlightBlock",      { fg = p.bg,     bg = p.blue })
  hi("MasonHighlightBlockBold",  { fg = p.bg,     bg = p.blue,  bold = true })
  hi("MasonHighlightSecondary",  { fg = p.mauve })
  hi("MasonMuted",               { fg = p.fg_muted })
  hi("MasonError",               { fg = p.red })
  hi("MasonWarning",             { fg = p.yellow })
  hi("MasonHeading",             { fg = p.lavender, bold = true })

  -- ────────────────────────────────────────────────────────────
  -- Neo-tree / Oil
  -- ────────────────────────────────────────────────────────────
  hi("NeoTreeNormal",            { fg = p.fg,      bg = p.bg1 })
  hi("NeoTreeNormalNC",          { fg = p.fg_dim,  bg = p.bg1 })
  hi("NeoTreeDirectoryName",     { fg = p.blue })
  hi("NeoTreeDirectoryIcon",     { fg = p.blue })
  hi("NeoTreeFileName",          { fg = p.fg })
  hi("NeoTreeRootName",          { fg = p.mauve,   bold = true })
  hi("NeoTreeGitAdded",          { fg = p.green })
  hi("NeoTreeGitConflict",       { fg = p.red,     bold = true })
  hi("NeoTreeGitDeleted",        { fg = p.red })
  hi("NeoTreeGitIgnored",        { fg = p.fg_muted })
  hi("NeoTreeGitModified",       { fg = p.yellow })
  hi("NeoTreeGitUntracked",      { fg = p.orange })
  hi("NeoTreeExpander",          { fg = p.border2 })
  hi("NeoTreeIndentMarker",      { fg = p.border })
  hi("NeoTreeWinSeparator",      { fg = p.border,  bg = p.bg1 })
  hi("OilDir",                   { fg = p.blue })
  hi("OilFile",                  { fg = p.fg })
  hi("OilLink",                  { fg = p.cyan })
  hi("OilCreate",                { fg = p.green })
  hi("OilDelete",                { fg = p.red })
  hi("OilMove",                  { fg = p.mauve })

  -- ────────────────────────────────────────────────────────────
  -- which-key
  -- ────────────────────────────────────────────────────────────
  hi("WhichKey",                 { fg = p.mauve })
  hi("WhichKeyGroup",            { fg = p.blue })
  hi("WhichKeyDesc",             { fg = p.fg })
  hi("WhichKeySeparator",        { fg = p.border2 })
  hi("WhichKeyNormal",           { fg = p.fg,     bg = p.bg2 })
  hi("WhichKeyBorder",           { fg = p.border, bg = p.bg2 })
  hi("WhichKeyTitle",            { fg = p.blue,   bold = true })

  -- ────────────────────────────────────────────────────────────
  -- Flash / Hop
  -- ────────────────────────────────────────────────────────────
  hi("FlashBackdrop",            { fg = p.fg_muted })
  hi("FlashLabel",               { fg = p.bg,     bg = p.orange, bold = true })
  hi("FlashMatch",               { fg = p.bg,     bg = p.blue })
  hi("FlashCurrent",             { fg = p.bg,     bg = p.mauve })
  hi("FlashPrompt",              { fg = p.mauve })
  hi("HopNextKey",               { fg = p.orange, bold = true, underline = true })
  hi("HopNextKey1",              { fg = p.blue,   bold = true })
  hi("HopNextKey2",              { fg = p.sapphire })
  hi("HopUnmatched",             { fg = p.fg_muted })

  -- ────────────────────────────────────────────────────────────
  -- Illuminate / Treesitter context
  -- ────────────────────────────────────────────────────────────
  hi("IlluminatedWordText",      { bg = p.bg3 })
  hi("IlluminatedWordRead",      { bg = p.bg3 })
  hi("IlluminatedWordWrite",     { bg = p.bg3, bold = true })
  hi("TreesitterContext",        { bg = p.bg1 })
  hi("TreesitterContextBottom",  { underline = true, sp = p.border2 })

  -- ────────────────────────────────────────────────────────────
  -- Terminal colors
  -- ────────────────────────────────────────────────────────────
  vim.g.terminal_color_0  = p.t_black
  vim.g.terminal_color_1  = p.red
  vim.g.terminal_color_2  = p.green
  vim.g.terminal_color_3  = p.yellow
  vim.g.terminal_color_4  = p.blue
  vim.g.terminal_color_5  = p.mauve
  vim.g.terminal_color_6  = p.teal
  vim.g.terminal_color_7  = p.t_white
  vim.g.terminal_color_8  = p.bg5
  vim.g.terminal_color_9  = p.red
  vim.g.terminal_color_10 = p.green
  vim.g.terminal_color_11 = p.yellow
  vim.g.terminal_color_12 = p.blue
  vim.g.terminal_color_13 = p.purple
  vim.g.terminal_color_14 = p.cyan
  vim.g.terminal_color_15 = p.t_white
end

return M
