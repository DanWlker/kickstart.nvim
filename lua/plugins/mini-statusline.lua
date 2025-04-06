local icons = require 'shared.icons'
local diagnostics_highlight = {
  { name = 'ERROR', hl = 'MiniStatuslineDiagnosticError' },
  { name = 'WARN', hl = 'MiniStatuslineDiagnosticWarn' },
  { name = 'INFO', hl = 'MiniStatuslineDiagnosticInfo' },
  { name = 'HINT', hl = 'MiniStatuslineDiagnosticHint' },
}

local function show_macro_recording()
  local recording_register = vim.fn.reg_recording()
  if recording_register == '' then
    return ''
  else
    return '  ' .. recording_register
    -- return '󰑊  ' .. recording_register
    -- return '󰑋  ' .. recording_register
  end
end

local make_color = function(hl_fg, hl_bg)
  ---@class vim.api.keyset.highlight
  ---@diagnostic disable-next-line: assign-type-mismatch
  local fghl = vim.api.nvim_get_hl(0, { name = hl_fg })
  local bghl = vim.api.nvim_get_hl(0, { name = hl_bg })
  fghl.fg = fghl.bg
  fghl.bg = bghl.bg
  vim.api.nvim_set_hl(0, hl_fg .. '2', fghl)
end

local modify_mode_group_hl = function(changeTo)
  local _, mode_hl = MiniStatusline.section_mode { trunc_width = 50 }
  make_color(mode_hl, changeTo)
end

vim.api.nvim_create_autocmd('VimEnter', {
  pattern = '*',
  desc = 'add more hl groups',
  callback = function()
    local _, mode_hl = MiniStatusline.section_mode { trunc_width = 50 }
    make_color(mode_hl, 'MiniStatuslineFilename')
    make_color('MiniStatuslineDevinfo', 'MiniStatuslineFilename')
    make_color('MiniStatuslineFileInfo', 'MiniStatuslineFilename')
  end,
})

return {
  'echasnovski/mini.statusline',
  dependencies = {
    {
      'echasnovski/mini-git',
      main = 'mini.git',
      config = function()
        require('mini.git').setup {}

        -- Use only HEAD name as summary string
        local format_summary = function(data)
          -- Utilize buffer-local table summary
          local summary = vim.b[data.buf].minigit_summary
          vim.b[data.buf].minigit_summary_string = summary.head_name or ''
        end

        local au_opts = { pattern = 'MiniGitUpdated', callback = format_summary }
        vim.api.nvim_create_autocmd('User', au_opts)
      end,
    },
  },
  config = function()
    local MiniStatusline = require 'mini.statusline'

    local CTRL_S = vim.api.nvim_replace_termcodes('<C-S>', true, true, true)
    local CTRL_V = vim.api.nvim_replace_termcodes('<C-V>', true, true, true)
    MiniStatusline.section_mode = function(args)
      local modes = setmetatable({
        ['n'] = { long = '(˵•̀ ᴗ -)', short = 'N', hl = 'MiniStatuslineModeNormal' },
        ['v'] = { long = '( -_・)σ', short = 'V', hl = 'MiniStatuslineModeVisual' },
        ['V'] = { long = '( -_・)σ', short = 'V-L', hl = 'MiniStatuslineModeVisual' },
        [CTRL_V] = { long = '( -_・)σ', short = 'V-B', hl = 'MiniStatuslineModeVisual' },
        ['s'] = { long = '(´ ▽｀) ', short = 'S', hl = 'MiniStatuslineModeVisual' },
        ['S'] = { long = '(´ ▽｀) ', short = 'S-L', hl = 'MiniStatuslineModeVisual' },
        [CTRL_S] = { long = '(´ ▽｀) ', short = 'S-B', hl = 'MiniStatuslineModeVisual' },
        ['i'] = { long = '(•̀ - •́ )', short = 'I', hl = 'MiniStatuslineModeInsert' },
        ['R'] = { long = '( •̯́ ₃ •̯̀)', short = 'R', hl = 'MiniStatuslineModeReplace' },
        ['c'] = { long = 'Σ(°△°ꪱꪱ)', short = 'C', hl = 'MiniStatuslineModeCommand' },
        ['r'] = { long = 'Σ(°△°ꪱꪱ)', short = 'P', hl = 'MiniStatuslineModeOther' },
        ['!'] = { long = 'Σ(°△°ꪱꪱ)', short = 'Sh', hl = 'MiniStatuslineModeOther' },
        ['t'] = { long = ' (⌐■_■) ', short = 'T', hl = 'MiniStatuslineModeOther' },
      }, {
        __index = function()
          return { long = 'Unknown', short = 'U', hl = '%#MiniStatuslineModeOther#' }
        end,
      })
      local mode_info = modes[vim.fn.mode()]
      local mode = MiniStatusline.is_truncated(args.trunc_width) and mode_info.short or mode_info.long
      return mode, mode_info.hl
    end

    MiniStatusline.section_location = function()
      return '%2l:%-2v'
    end

    MiniStatusline.section_diagnostics = function(args)
      if MiniStatusline.is_truncated(args.trunc_width) or not vim.diagnostic.is_enabled { bufnr = 0 } then
        return ''
      end

      -- Construct string parts
      local count = vim.diagnostic.count(0)
      local severity, t = vim.diagnostic.severity, {}
      for _, level in ipairs(diagnostics_highlight) do
        local n = count[severity[level.name]] or 0
        -- Add level info only if diagnostic is present
        if n > 0 then
          table.insert(t, ' ' .. '%#' .. level.hl .. '#' .. icons[level.name] .. n)
        end
      end
      if #t == 0 then
        return ''
      end

      return table.concat(t, '')
    end

    MiniStatusline.combine_groups = function(groups)
      local parts = vim.tbl_map(function(s)
        if type(s) == 'string' then
          return s
        end
        if type(s) ~= 'table' then
          return ''
        end

        local string_arr = vim.tbl_filter(function(x)
          return type(x) == 'string' and x ~= ''
        end, s.strings or {})
        local str = table.concat(string_arr, ' ')

        -- Use previous highlight group
        if s.hl == nil then
          return ' ' .. str .. ' '
        end

        -- Allow using this highlight group later
        if #str == 0 then
          return '%#' .. s.hl .. '#'
        end

        return string.format('%%#%s#%s', s.hl, str) -- If you're wondering this is where it changed, removed space
      end, groups)

      return table.concat(parts, '')
    end

    MiniStatusline.setup {
      content = {
        active = function()
          local mode, mode_hl = MiniStatusline.section_mode { trunc_width = 120 }
          local git = MiniStatusline.section_git { icon = '', trunc_width = 40 }
          local diagnostics = MiniStatusline.section_diagnostics { trunc_width = 75 }
          local filename = MiniStatusline.section_filename { trunc_width = 140 }
          local fileinfo = MiniStatusline.section_fileinfo { trunc_width = 120 }
          local location = MiniStatusline.section_location()
          local recording = show_macro_recording()

          local tab = {
            -- { hl = mode_hl .. '2', strings = { ' ' } },
            -- { hl = mode_hl .. '2', strings = { '' } },
            { hl = mode_hl, strings = { ' ' .. mode .. ' ' } },
            { hl = mode_hl .. '2', strings = { '' } },
            '%<', -- Mark general truncate point
          }

          if #table.concat { git, diagnostics } > 0 then
            modify_mode_group_hl 'MiniStatuslineDevinfo'
            table.insert(tab, { hl = 'MiniStatuslineDevinfo', strings = { ' ', git, diagnostics } })
            table.insert(tab, { hl = 'MiniStatuslineDevinfo2', strings = { '' } })
            table.insert(tab, '%<') -- Mark general truncate point
          else
            modify_mode_group_hl 'MiniStatuslineFilename'
          end
          table.insert(tab, { hl = 'MiniStatuslineFilename', strings = { '%=' .. filename } })
          table.insert(tab, '%=')
          if #recording > 0 then
            table.insert(tab, { hl = 'MiniStatuslineRecording', strings = { recording } })
          end
          if #fileinfo > 0 then
            table.insert(tab, { hl = 'MiniStatuslineFileinfo2', strings = { '' } })
            table.insert(tab, { hl = 'MiniStatuslineFileinfo', strings = { ' ' .. fileinfo .. ' ' } })
          end
          table.insert(tab, { hl = mode_hl .. '2', strings = { '' } })
          table.insert(tab, { hl = mode_hl, strings = { location } })
          -- table.insert(tab, { hl = mode_hl .. '2', strings = { '' } })
          -- table.insert(tab, { hl = mode_hl .. '2', strings = { ' ' } })

          return MiniStatusline.combine_groups(tab)
        end,
        inactive = function()
          return '%=%#MiniStatuslineInactive#%F%='
        end,
      },
      use_icons = vim.g.have_nerd_font,
    }
  end,
}
