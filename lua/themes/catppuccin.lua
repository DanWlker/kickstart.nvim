local color_menu = '#161617'
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
      local custom_stuff = {
        WinSeparator = { fg = colors.surface2 },

        -- [[ Visual whitespace ]]
        VisualNonText = { fg = colors.overlay0, bg = colors.surface1 },

        -- [[ Blink cmp ]]
        -- With border
        BlinkCmpMenu = { bg = colors.base },
        BlinkCmpMenuBorder = { fg = colors.lavender, bg = colors.base },
        BlinkCmpDoc = { bg = colors.base },
        BlinkCmpDocBorder = { fg = colors.overlay0, bg = colors.base },
        BlinkCmpSignatureHelpBorder = { fg = colors.overlay0, bg = colors.base },
        NormalFloat = { fg = colors.text, bg = colors.none },
        BlinkCmpMenuSelection = { bg = '#474b66' },
        -- No Border
        -- BlinkCmpDoc = { bg = color_menu },
        -- BlinkCmpDocBorder = { fg = color_menu, bg = color_menu },
        -- BlinkCmpSignatureHelpBorder = { fg = color_menu, bg = color_menu },
        -- NormalFloat = { bg = color_menu },
        -- FloatBorder = { fg = color_menu, bg = color_menu },

        -- [[ Telescope ]]
        -- TelescopeNormal = { bg = colors.mantle },
        -- TelescopePreviewTitle = {
        --   fg = colors.base,
        --   bg = colors.green,
        -- },
        -- TelescopePromptTitle = {
        --   fg = colors.base,
        --   bg = colors.pink,
        -- },
        -- TelescopeSelection = { bg = colors.surface0, fg = colors.text },
        -- TelescopeResultsDiffAdd = { fg = colors.green },
        -- TelescopeResultsDiffChange = { fg = colors.yellow },
        -- TelescopeResultsDiffDelete = { fg = colors.red },
        -- TelescopeBorder = { fg = colors.mantle, bg = colors.mantle },
        -- TelescopePromptBorder = { fg = colors.mantle, bg = colors.mantle },
        -- TelescopePromptNormal = { fg = colors.text, bg = colors.mantle },
        -- TelescopeResultsTitle = { fg = colors.mantle, bg = colors.mantle },
        -- TelescopePromptPrefix = { fg = colors.red, bg = colors.mantle },

        -- [[ Mini indent scope ]]
        -- MiniIndentscopeSymbol = { fg = colors.overlay2 },

        -- [[ Nvim notify ]]
        -- NotifyINFOBorder = { fg = colors.green },
        -- NotifyINFOIcon = { fg = colors.green },
        -- NotifyINFOTitle = { fg = colors.green, style = { 'italic' } },

        -- [[ Mini statusline ]]
        -- MiniStatuslineDevinfo = { bg = colors.surface0 },
        -- MiniStatuslineFileinfo = { bg = colors.surface0 },
        -- MiniStatuslineDiagnosticError = { bg = colors.surface0, fg = colors.red },
        -- MiniStatuslineDiagnosticWarn = { bg = colors.surface0, fg = colors.yellow },
        -- MiniStatuslineDiagnosticInfo = { bg = colors.surface0, fg = colors.sky },
        -- MiniStatuslineDiagnosticHint = { bg = colors.surface0, fg = colors.teal },
        -- MiniStatuslineRecording = { bg = colors.red, fg = colors.base },

        -- [[ Snacks nvim ]]
        SnacksIndentChunk = { fg = '#9399b2' },
        SnacksIndentScope = { fg = '#9399b2' },
        SnacksPickerBorder = { fg = colors.lavender },
        -- SnacksPickerBorder = { fg = colors.mantle, bg = colors.mantle },
        -- SnacksPicker = { fg = colors.text, bg = colors.mantle },
        -- SnacksPickerTitle = { fg = colors.base, bg = colors.lavender },
        --
        -- SnacksPickerBorder = { fg = colors.lavender, bg = colors.mantle },

        -- With Border
        FzfLuaBorder = { fg = colors.lavender },
        -- No Border
        -- FzfLuaNormal = { bg = colors.mantle },
        -- FzfLuaBorder = { fg = colors.mantle, bg = colors.mantle },
        -- FzfLuaTitle = {
        --   fg = colors.base,
        --   bg = colors.lavender,
        -- },
        -- FzfLuaHeaderBind = { fg = colors.rosewater },
        -- FzfLuaHeaderText = { fg = colors.green },
        StatuslineModeSeparator = { bg = colors.lavender },
        StatuslineMode = { bg = colors.lavender },

        -- [[ Winbar from maria's config ]]
        WinBar = { fg = colors.fg, bg = colors.base },
        WinBarIndDir = { fg = colors.fg, bg = colors.surface0 },
        -- WinBarDir = { fg = colors.lavender, bg = colors.base, italic = true },
        -- WinBarSeparator = { fg = colors.lavender, bg = colors.base },
        WinBarDir = { fg = colors.lavender, bg = colors.surface0, italic = true },
        WinBarSeparator = { fg = colors.lavender, bg = colors.surface0 },
        WinBarEndSeparators = { fg = colors.surface0 },

        --[[ Highlight Url ]]
        -- HighlightUrl = { underline = true, fg = colors.blue, sp = colors.blue },

        -- [[ Bufferline ]]
        BufferLineBufferSelected = { bg = colors.base, sp = colors.lavender },
        BufferLineFill = { bg = colors.base },
        TabLine = { fg = colors.text, bg = colors.base },
        TabLineFill = { bg = colors.base },
        TabLineSel = { bg = colors.lavender },
      }

      for mode, color in pairs {
        Normal = colors.lavender,
        Pending = colors.pink,
        Visual = colors.yellow,
        Insert = colors.green,
        Command = colors.teal,
        Other = colors.peach,
      } do
        custom_stuff['StatuslineMode' .. mode] = { fg = colors.base, bg = color }
        custom_stuff['StatuslineModeSeparator' .. mode] = { fg = color, bg = colors.base }
      end
      return custom_stuff
    end,
  },
}
