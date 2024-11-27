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

        FzfLuaNormal = { bg = colors.mantle },
        FzfLuaBorder = { fg = colors.mantle, bg = colors.mantle },
        FzfLuaTitle = {
          fg = colors.base,
          bg = colors.lavender,
        },
        FzfLuaHeaderBind = { fg = colors.rosewater },
        FzfLuaHeaderText = { fg = colors.green },
      }
    end,
  },
}
