-- Astra Cyan / Per Aspera Ad Astra
-- Native Neovim colorscheme. No extra colorscheme plugin required.
local p = require("skeletor.palette")

vim.o.background = "dark"
vim.o.termguicolors = true
vim.cmd("highlight clear")
vim.g.colors_name = "astra-cyan"

local function hl(name, settings)
  vim.api.nvim_set_hl(0, name, settings)
end

local function groups(names, settings)
  for _, name in ipairs(names) do
    hl(name, settings)
  end
end

-- Base UI. Keep the main editor and floating windows transparent for Kitty.
groups({ "Normal", "NormalNC", "NormalFloat" }, { fg = p.fg, bg = "NONE" })
groups({ "SignColumn", "FoldColumn" }, { fg = p.comment, bg = "NONE" })
groups({ "WinBar", "WinBarNC" }, { fg = p.fg, bg = "NONE" })
groups({ "StatusLine", "StatusLineNC" }, { fg = p.fg, bg = "NONE" })
groups({ "TabLine", "TabLineFill" }, { fg = p.comment, bg = "NONE" })
hl("TabLineSel", { fg = p.cyan, bg = "NONE", bold = true })
hl("LineNr", { fg = p.comment, bg = "NONE" })
hl("CursorLineNr", { fg = p.cyan, bg = "NONE", bold = true })
hl("CursorLine", { bg = p.line })
hl("CursorColumn", { bg = p.line })
hl("ColorColumn", { bg = p.line })
hl("Visual", { bg = p.selection })
hl("VisualNOS", { bg = p.selection })
hl("Search", { fg = p.bg, bg = p.amber })
groups({ "IncSearch", "CurSearch", "Substitute" }, { fg = p.bg, bg = p.cyan, bold = true })
hl("MatchParen", { fg = p.cyan, bg = p.selection, bold = true })
hl("Pmenu", { fg = p.fg, bg = p.surface })
hl("PmenuSel", { fg = p.bg, bg = p.cyan, bold = true })
hl("PmenuSbar", { bg = p.surface })
hl("PmenuThumb", { bg = p.comment })
hl("FloatBorder", { fg = p.cyan, bg = "NONE" })
hl("FloatTitle", { fg = p.cyan, bg = "NONE", bold = true })
hl("WinSeparator", { fg = p.border, bg = "NONE" })
hl("Folded", { fg = p.comment, bg = p.surface })
groups({ "NonText", "Whitespace", "SpecialKey", "EndOfBuffer" }, { fg = p.invisible, bg = "NONE" })
hl("Directory", { fg = p.cyan })
hl("Title", { fg = p.cyan, bold = true })
hl("Conceal", { fg = p.muted })
hl("Question", { fg = p.cyan })
hl("ModeMsg", { fg = p.cyan, bold = true })
hl("MoreMsg", { fg = p.green })
hl("WarningMsg", { fg = p.amber })
hl("ErrorMsg", { fg = p.error })

-- Vim fallback syntax (when no Tree-sitter grammar is installed).
hl("Comment", { fg = p.comment, italic = true })
hl("Constant", { fg = p.boolean })
hl("String", { fg = p.green })
hl("Character", { fg = p.green })
hl("Number", { fg = p.amber })
hl("Boolean", { fg = p.boolean })
hl("Float", { fg = p.amber })
hl("Identifier", { fg = p.fg })
hl("Function", { fg = p.cyan })
groups({
  "Statement",
  "Conditional",
  "Repeat",
  "Keyword",
  "Exception",
  "Include",
  "Define",
  "Macro",
  "PreProc",
  "StorageClass",
}, { fg = p.violet })
hl("Operator", { fg = p.muted })
hl("Type", { fg = p.blue })
hl("Structure", { fg = p.blue })
hl("Typedef", { fg = p.blue })
hl("Special", { fg = p.cyan })
hl("SpecialChar", { fg = p.cyan })
hl("Delimiter", { fg = p.punctuation })
hl("Tag", { fg = p.cyan })
hl("Underlined", { fg = p.blue, underline = true })
hl("Todo", { fg = p.bg, bg = p.amber, bold = true })
hl("Error", { fg = p.error, bg = p.diff_delete })

-- Tree-sitter (Neovim 0.10+ capture names).
groups({ "@comment", "@comment.documentation" }, { fg = p.comment, italic = true })
hl("@comment.todo", { fg = p.amber, bold = true })
groups({
  "@keyword",
  "@keyword.function",
  "@keyword.return",
  "@keyword.conditional",
  "@keyword.repeat",
  "@keyword.import",
  "@keyword.exception",
  "@keyword.modifier",
  "@keyword.directive",
}, { fg = p.violet })
groups({ "@operator", "@keyword.operator" }, { fg = p.muted })
groups({ "@string", "@character" }, { fg = p.green })
hl("@string.regexp", { fg = p.regex })
groups({ "@string.escape", "@string.special", "@string.special.symbol" }, { fg = p.cyan })
groups({ "@number", "@number.float" }, { fg = p.amber })
groups({ "@boolean", "@constant.builtin" }, { fg = p.boolean })
hl("@constant", { fg = p.fg })
hl("@variable", { fg = p.fg })
hl("@variable.builtin", { fg = p.boolean })
hl("@variable.parameter", { fg = p.param })
hl("@variable.member", { fg = p.property })
groups(
  { "@function", "@function.call", "@function.builtin", "@function.method", "@function.method.call", "@constructor" },
  { fg = p.cyan }
)
groups({ "@type", "@type.builtin", "@type.definition", "@attribute" }, { fg = p.blue })
hl("@module", { fg = p.module })
hl("@property", { fg = p.property })
hl("@label", { fg = p.violet })
groups({ "@punctuation.delimiter", "@punctuation.bracket", "@punctuation.special" }, { fg = p.punctuation })
hl("@tag", { fg = p.cyan })
hl("@tag.attribute", { fg = p.violet })
hl("@tag.delimiter", { fg = p.punctuation })

-- Markdown, markup and diffs.
hl("@markup.heading", { fg = p.cyan, bold = true })
hl("@markup.strong", { fg = p.fg, bold = true })
hl("@markup.italic", { fg = p.param, italic = true })
hl("@markup.link", { fg = p.blue, underline = true })
hl("@markup.link.url", { fg = p.blue, underline = true })
hl("@markup.raw", { fg = p.green })
hl("@markup.quote", { fg = p.help })
hl("@markup.list", { fg = p.violet })
hl("@diff.plus", { fg = p.add })
hl("@diff.minus", { fg = p.delete })
hl("@diff.delta", { fg = p.amber })
hl("DiffAdd", { fg = p.add, bg = p.diff_add })
hl("DiffDelete", { fg = p.delete, bg = p.diff_delete })
hl("DiffChange", { fg = p.amber, bg = p.diff_change })
hl("DiffText", { fg = p.amber, bg = p.selection, bold = true })
hl("Added", { fg = p.add })
hl("Removed", { fg = p.delete })
hl("Changed", { fg = p.amber })

-- LSP semantic tokens (otherwise the language server can override Tree-sitter colors).
groups({ "@lsp.type.function", "@lsp.type.method" }, { fg = p.cyan })
groups({
  "@lsp.type.class",
  "@lsp.type.struct",
  "@lsp.type.interface",
  "@lsp.type.enum",
  "@lsp.type.type",
  "@lsp.type.typeParameter",
}, { fg = p.blue })
hl("@lsp.type.namespace", { fg = p.module })
hl("@lsp.type.variable", { fg = p.fg })
hl("@lsp.type.parameter", { fg = p.param })
hl("@lsp.type.property", { fg = p.property })
hl("@lsp.type.enumMember", { fg = p.amber })
hl("@lsp.mod.deprecated", { strikethrough = true })

-- Diagnostics, Git and spell checking.
local diagnostics = {
  Error = p.delete,
  Warn = p.amber,
  Info = p.blue,
  Hint = p.cyan,
  Ok = p.add,
}
for name, color in pairs(diagnostics) do
  hl("Diagnostic" .. name, { fg = color })
  hl("DiagnosticSign" .. name, { fg = color, bg = "NONE" })
  hl("DiagnosticVirtualText" .. name, { fg = color, bg = "NONE" })
  hl("DiagnosticUnderline" .. name, { undercurl = true, sp = color })
  hl("DiagnosticFloating" .. name, { fg = color, bg = "NONE" })
end
hl("SpellBad", { undercurl = true, sp = p.delete })
hl("SpellCap", { undercurl = true, sp = p.blue })
hl("SpellLocal", { undercurl = true, sp = p.cyan })
hl("SpellRare", { undercurl = true, sp = p.violet })
hl("GitSignsAdd", { fg = p.add, bg = "NONE" })
hl("GitSignsChange", { fg = p.amber, bg = "NONE" })
hl("GitSignsDelete", { fg = p.delete, bg = "NONE" })

-- Optional LazyVim ecosystem integrations. Unknown groups are harmless.
groups({
  "NeoTreeNormal",
  "NeoTreeNormalNC",
  "NeoTreeEndOfBuffer",
  "SnacksPickerNormal",
  "TelescopeNormal",
  "FzfLuaNormal",
  "WhichKeyFloat",
}, { bg = "NONE" })
groups({
  "NeoTreeDirectoryName",
  "NeoTreeDirectoryIcon",
  "TelescopeMatching",
  "FzfLuaMatch",
  "BlinkCmpLabelMatch",
  "SnacksPickerMatch",
  "SnacksDashboardHeader",
  "SnacksDashboardIcon",
  "WhichKey",
}, { fg = p.cyan })
groups({ "NeoTreeGitAdded" }, { fg = p.add })
groups({ "NeoTreeGitModified" }, { fg = p.amber })
groups({ "NeoTreeGitDeleted" }, { fg = p.delete })
groups({
  "TelescopeBorder",
  "FzfLuaBorder",
  "BlinkCmpMenuBorder",
  "BlinkCmpDocBorder",
  "SnacksPickerBorder",
  "WhichKeyBorder",
}, { fg = p.cyan, bg = "NONE" })
groups(
  { "TelescopeSelection", "FzfLuaCursorLine", "BlinkCmpMenuSelection", "SnacksPickerListCursorLine" },
  { bg = p.selection }
)
hl("BlinkCmpMenu", { fg = p.fg, bg = p.surface })
hl("BlinkCmpDoc", { fg = p.fg, bg = p.surface })
hl("WhichKeyGroup", { fg = p.violet })
hl("WhichKeyDesc", { fg = p.fg })
hl("SnacksIndent", { fg = p.border })
hl("SnacksIndentScope", { fg = p.cyan })
hl("SnacksDashboardKey", { fg = p.violet })
hl("SnacksDashboardDesc", { fg = p.fg })
hl("SnacksDashboardFooter", { fg = p.comment })
hl("LazyNormal", { fg = p.fg, bg = "NONE" })
