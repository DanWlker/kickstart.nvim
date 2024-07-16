return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  opts = {
    integrations = {
      native_lsp = {
        underlines = {
          errors = { 'undercurl' },
          hints = { 'undercurl' },
          warnings = { 'undercurl' },
          information = { 'undercurl' },
        },
      },
    },
    custom_highlights = function(colors)
      return {
        WinSeparator = { fg = colors.surface2 },

        VisualNonText = { fg = colors.surface2, bg = colors.surface1 },

        BlinkCmpMenu = { fg = colors.text, bg = colors.base },
        BlinkCmpMenuBorder = { fg = colors.overlay0, bg = colors.base },
        BlinkCmpDoc = { fg = colors.text, bg = colors.base },

        -- Remove when switching to blink
        CmpItemKindText = { fg = colors.green },
        CmpItemKindMethod = { fg = colors.blue },
        CmpItemKindFunction = { fg = colors.blue },
        CmpItemKindConstructor = { fg = colors.blue },
        CmpItemKindField = { fg = colors.green },
        CmpItemKindVariable = { fg = colors.flamingo },
        CmpItemKindClass = { fg = colors.yellow },
        CmpItemKindInterface = { fg = colors.yellow },
        CmpItemKindModule = { fg = colors.blue },
        CmpItemKindProperty = { fg = colors.blue },
        CmpItemKindUnit = { fg = colors.green },
        CmpItemKindValue = { fg = colors.peach },
        CmpItemKindEnum = { fg = colors.yellow },
        CmpItemKindKeyword = { fg = colors.mauve },
        CmpItemKindSnippet = { fg = colors.flamingo },
        CmpItemKindColor = { fg = colors.red },
        CmpItemKindFile = { fg = colors.blue },
        CmpItemKindReference = { fg = colors.red },
        CmpItemKindFolder = { fg = colors.blue },
        CmpItemKindEnumMember = { fg = colors.teal },
        CmpItemKindConstant = { fg = colors.peach },
        CmpItemKindStruct = { fg = colors.blue },
        CmpItemKindEvent = { fg = colors.blue },
        CmpItemKindOperator = { fg = colors.sky },
        CmpItemKindTypeParameter = { fg = colors.maroon },

        TelescopeNormal = { bg = colors.mantle },
        TelescopePreviewTitle = {
          fg = colors.base,
          bg = colors.green,
        },
        TelescopePromptTitle = {
          fg = colors.base,
          bg = colors.pink,
        },
        TelescopeSelection = { bg = colors.surface0, fg = colors.text },
        TelescopeResultsDiffAdd = { fg = colors.green },
        TelescopeResultsDiffChange = { fg = colors.yellow },
        TelescopeResultsDiffDelete = { fg = colors.red },
        TelescopeBorder = { fg = colors.mantle, bg = colors.mantle },
        TelescopePromptBorder = { fg = colors.mantle, bg = colors.mantle },
        TelescopePromptNormal = { fg = colors.text, bg = colors.mantle },
        TelescopeResultsTitle = { fg = colors.mantle, bg = colors.mantle },
        TelescopePromptPrefix = { fg = colors.red, bg = colors.mantle },
      }
    end,
  },
}
