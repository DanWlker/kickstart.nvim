-- if vim.g.neovide then
--   return {
--     'danwlker/primeppuccin',
--     priority = 1000,
--   }
-- end
return {
  'catppuccin/nvim',
  name = 'catppuccin',
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
        WinSeparator = { fg = colors.subtext0 },
      }
    end,
  },
}
