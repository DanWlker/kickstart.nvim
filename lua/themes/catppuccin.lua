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
    float = {
      transparent = true,
    },
    custom_highlights = function(colors)
      local custom_stuff = {
        WinSeparator = { fg = colors.surface2 },
        -- NormalFloat = { fg = colors.text, bg = colors.none },
        -- FloatBorder = { fg = colors.blue, bg = colors.none },

        -- [[ Which key ]]
        WhichKeyTitle = { fg = colors.subtext0, bg = colors.none },

        -- [[ Visual whitespace ]]
        VisualNonText = { fg = colors.overlay0, bg = colors.surface1 },

        -- [[ Blink cmp ]]
        -- With border
        BlinkCmpMenu = { bg = colors.base },
        BlinkCmpMenuBorder = { fg = colors.lavender, bg = colors.base },
        -- BlinkCmpDoc = { bg = colors.base },
        -- BlinkCmpDocBorder = { fg = colors.overlay0, bg = colors.base },
        BlinkCmpDocBorder = { fg = colors.overlay0 },
        -- BlinkCmpSignatureHelpBorder = { fg = colors.overlay0, bg = colors.base },
        BlinkCmpSignatureHelpBorder = { fg = colors.overlay0 },
        BlinkCmpMenuSelection = { bg = '#474b66' },

        -- [[ Telescope ]]
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
        -- SnacksIndentChunk = { fg = '#9399b2' },
        -- SnacksIndentScope = { fg = '#9399b2' },
        SnacksPickerBorder = { fg = colors.lavender },
        -- SnacksPickerBorder = { fg = colors.mantle, bg = colors.mantle },
        -- SnacksPicker = { fg = colors.text, bg = colors.mantle },
        -- SnacksPickerTitle = { fg = colors.base, bg = colors.lavender },
        --
        -- SnacksPickerBorder = { fg = colors.lavender, bg = colors.mantle },

        -- [[ Winbar from maria's config ]]
        WinBar = { fg = colors.fg, bg = colors.base },
        WinBarIndDir = { fg = colors.fg, bg = colors.base },
        WinBarDir = { fg = colors.lavender, bg = colors.base, italic = true },
        WinBarSeparator = { fg = colors.lavender, bg = colors.base },
        -- WinBarDir = { fg = colors.lavender, bg = colors.surface0, italic = true },
        -- WinBarSeparator = { fg = colors.lavender, bg = colors.surface0 },
        WinBarEndSeparators = { fg = colors.base },

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

      -- https://github.com/catppuccin/nvim/pull/804#pullrequestreview-3080755868
      local O = require('catppuccin').options
      local original_highlight = {
        ['@variable.member'] = { fg = colors.lavender },                                         -- For fields.
        ['@module'] = { fg = colors.lavender, style = O.styles.miscs or { 'italic' } },          -- For identifiers referring to modules and namespaces.
        ['@string.special.url'] = { fg = colors.rosewater, style = { 'italic', 'underline' } },  -- urls, links and emails
        ['@type.builtin'] = { fg = colors.yellow, style = O.styles.properties or { 'italic' } }, -- For builtin types.
        ['@property'] = { fg = colors.lavender, style = O.styles.properties or {} },             -- Same as TSField.
        ['@constructor'] = { fg = colors.sapphire },                                             -- For constructor calls and definitions: = { } in Lua, and Java constructors.
        ['@keyword.operator'] = { link = 'Operator' },                                           -- For new keyword operator
        ['@keyword.export'] = { fg = colors.sky, style = O.styles.keywords },
        ['@markup.strong'] = { fg = colors.maroon, style = { 'bold' } },                         -- bold
        ['@markup.italic'] = { fg = colors.maroon, style = { 'italic' } },                       -- italic
        ['@markup.heading'] = { fg = colors.blue, style = { 'bold' } },                          -- titles like: # Example
        ['@markup.quote'] = { fg = colors.maroon, style = { 'bold' } },                          -- block quotes
        ['@markup.link'] = { link = 'Tag' },                                                     -- text references, footnotes, citations, etc.
        ['@markup.link.label'] = { link = 'Label' },                                             -- link, reference descriptions
        ['@markup.link.url'] = { fg = colors.rosewater, style = { 'italic', 'underline' } },     -- urls, links and emails
        ['@markup.raw'] = { fg = colors.teal },                                                  -- used for inline code in markdown and for doc in python (""")
        ['@markup.list'] = { link = 'Special' },
        ['@tag'] = { fg = colors.mauve },                                                        -- Tags like html tag names.
        ['@tag.attribute'] = { fg = colors.teal, style = O.styles.miscs or { 'italic' } },       -- Tags like html tag names.
        ['@tag.delimiter'] = { fg = colors.sky },                                                -- Tag delimiter like < > /
        ['@property.css'] = { fg = colors.lavender },
        ['@property.id.css'] = { fg = colors.blue },
        ['@type.tag.css'] = { fg = colors.mauve },
        ['@string.plain.css'] = { fg = colors.peach },
        ['@constructor.lua'] = { fg = colors.flamingo }, -- For constructor calls and definitions: = { } in Lua.
        -- typescript
        ['@property.typescript'] = { fg = colors.lavender, style = O.styles.properties or {} },
        ['@constructor.typescript'] = { fg = colors.lavender },
        -- TSX (Typescript React)
        ['@constructor.tsx'] = { fg = colors.lavender },
        ['@tag.attribute.tsx'] = { fg = colors.teal, style = O.styles.miscs or { 'italic' } },
        ['@type.builtin.c'] = { fg = colors.yellow, style = {} },
        ['@type.builtin.cpp'] = { fg = colors.yellow, style = {} },
      }
      return vim.tbl_extend('error', custom_stuff, original_highlight)
    end,
  },
}
