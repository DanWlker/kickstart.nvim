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
      blink_cmp = true,
      notify = true,
      snacks = true,
    },
    custom_highlights = function(colors)
      return {
        WinSeparator = { fg = colors.surface2 },

        VisualNonText = { fg = colors.surface2, bg = colors.surface1 },

        BlinkCmpMenu = { bg = colors.base },
        BlinkCmpMenuBorder = { fg = colors.overlay0, bg = colors.base },
        BlinkCmpDoc = { bg = colors.base },
        BlinkCmpDocBorder = { fg = colors.blue, bg = colors.base },
        BlinkCmpSignatureHelpBorder = { fg = colors.blue, bg = colors.base },

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

        -- MiniIndentscopeSymbol = { fg = colors.overlay2 },

        NotifyINFOBorder = { fg = colors.green },
        NotifyINFOIcon = { fg = colors.green },
        NotifyINFOTitle = { fg = colors.green, style = { 'italic' } },

        MiniStatuslineDevinfo = { bg = colors.surface0 },
        MiniStatuslineFileinfo = { bg = colors.surface0 },
        MiniStatuslineDiagnosticError = { bg = colors.surface0, fg = colors.red },
        MiniStatuslineDiagnosticWarn = { bg = colors.surface0, fg = colors.yellow },
        MiniStatuslineDiagnosticInfo = { bg = colors.surface0, fg = colors.sky },
        MiniStatuslineDiagnosticHint = { bg = colors.surface0, fg = colors.teal },
        MiniStatuslineRecording = { bg = colors.red, fg = colors.base },
      }
    end,
  },
}
