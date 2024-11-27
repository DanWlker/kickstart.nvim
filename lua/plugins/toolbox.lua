-- Color highlighting
local hasEnabledColorHighlighting = false

-- Lsp Lines
local hasEnabledLspLines = false
local lspLinesStateIsOn = false
local toggleLspLines = function()
  if lspLinesStateIsOn then
    vim.diagnostic.config {
      virtual_text = true,
      virtual_lines = false,
    }
    lspLinesStateIsOn = false
  else
    vim.diagnostic.config {
      virtual_text = false,
      virtual_lines = true,
    }
    lspLinesStateIsOn = true
  end
end

return {
  'DanWlker/toolbox.nvim',
  keys = {
    {
      '<leader>s',
      function()
        require('toolbox').show_picker()
      end,
      desc = 'Shortcuts in Toolbox',
      mode = { 'n', 'v' },
    },
  },
  dependencies = { 'ibhagwan/fzf-lua' },
  opts = {
    commands = {
      {
        name = 'Visual-whitespace: Toggle',
        execute = function()
          require('visual-whitespace').toggle()
        end,
      },
      {
        name = 'Wrap: Toggle',
        execute = 'set wrap!',
      },
      {
        name = 'Minimap: Toggle for buffer',
        execute = 'Neominimap bufToggle',
      },
      {
        name = 'Minimap: Toggle globally',
        execute = 'Neominimap toggle',
      },
      {
        name = 'Tab: Close',
        execute = 'tabclose',
      },
      {
        name = 'Json: Format',
        execute = "%!jq '.'",
      },
      {
        name = 'Print: Vim table',
        execute = function(v)
          print(vim.inspect(v))
        end,
      },
      {
        name = 'Copy: Relative path',
        execute = function()
          local path = vim.fn.expand '%'
          vim.fn.setreg('+', path)
        end,
      },
      {
        name = 'Copy: Absolute path',
        execute = function()
          local path = vim.fn.expand '%:p'
          vim.fn.setreg('+', path)
        end,
      },
      {
        name = 'Copy: Vim table',
        execute = function(v)
          vim.fn.setreg('+', vim.inspect(v))
        end,
      },
      {
        name = 'Plugin: Reload',
        execute = function(name)
          package.loaded[name] = nil
          require(name).setup()
        end,
      },
      {
        name = 'Csv: Align',
        execute = 'RainbowAlign',
      },
      {
        name = 'Csv: Shrink',
        execute = 'RainbowShrink',
      },
      {
        name = 'Color Highlighting: Toggle',
        execute = function()
          if hasEnabledColorHighlighting then
            require('nvim-highlight-colors').toggle()
            return
          end

          hasEnabledColorHighlighting = true
          require('nvim-highlight-colors').turnOn()
        end,
      },
      {
        name = 'Lsp-lines: Toggle',
        execute = function()
          if not hasEnabledLspLines then
            hasEnabledLspLines = true
            require 'lsp_lines'
          end
          toggleLspLines()
        end,
      },
      {
        name = 'Conform: Format buffer',
        execute = function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
      },
      {
        name = 'Lint: Lint Info',
        execute = 'LintInfo',
      },
      {
        name = 'Sql: Open Ui',
        execute = function()
          vim.cmd 'tabnew'
          vim.cmd 'DBUI'
          vim.cmd 'set shiftwidth=2'
        end,
      },
      {
        name = 'Sql: Toggle Ui',
        execute = 'DBUIToggle',
      },
      {
        name = 'Sql: Add Connection',
        execute = 'DBUIAddConnection',
      },
      {
        name = 'Sql: Clear Cache',
        execute = 'DBCompletionClearCache',
      },
      {
        name = 'Sql: Format',
        execute = '!sleek',
      },
      {
        name = 'Coverage: Load and Show',
        execute = 'Coverage',
      },
      {
        name = 'Coverage: Toggle',
        execute = 'CoverageToggle',
      },
      {
        name = 'Coverage: Summary',
        execute = 'CoverageSummary',
      },
    },
  },
  config = true,
}
