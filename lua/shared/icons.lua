local M = {}

--- Diagnostic severities.
M.diagnostics = {
  ERROR = '󰅚 ',
  WARN = '󰀪 ',
  HINT = '󰌶 ',
  INFO = '󰋽 ',
}

--- LSP symbol kinds.
M.symbol_kinds = {
  Text = '',
  Method = '󰊕',
  Function = '󰊕',
  Constructor = '󰒓',
  Field = '',
  Variable = '󰀫',
  Property = '󰖷',
  Class = '',
  Interface = '',
  Struct = '',
  Module = '󰅩',
  Unit = '',
  Value = '󰦨',
  Enum = '',
  EnumMember = '',
  Keyword = '󰌋',
  Constant = '󰏿',
  Snippet = '󱄽',
  Color = '󰏘',
  File = '󰈔',
  Reference = '',
  Folder = '󰉋',
  Event = '',
  Operator = '󰆕',
  TypeParameter = '',

  --from maria config
  Array = '󰅪',

  -- Extras for snacks nvim
  Boolean = '󰨙',
  Control = '',
  Collapsed = '',
  Copilot = '',
  Key = '󰌋',
  Namespace = '󰦮',
  Null = '',
  Number = '󰎠',
  Object = '',
  Package = '',
  String = '',
  Unknown = '',
}

--- Shared icons that don't really fit into a category.
M.misc = {
  bug = '',
  dashed_bar = '┊',
  ellipsis = '…',
  git = '',
  palette = '󰏘',
  robot = '󰚩',
  search = '',
  terminal = '',
  toolbox = '󰦬',
  vertical_bar = '│',
}

return M
