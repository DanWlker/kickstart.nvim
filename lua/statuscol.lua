local separator = '   '

local function get_num_wraps()
  -- Calculate the actual buffer width, accounting for splits, number columns, and other padding
  local wrapped_lines = vim.api.nvim_win_call(0, function()
    local winid = vim.api.nvim_get_current_win()

    -- get the width of the buffer
    local winwidth = vim.api.nvim_win_get_width(winid)
    local numberwidth = vim.wo.number and vim.wo.numberwidth or 0
    local signwidth = vim.fn.exists '*sign_define' == 1 and vim.fn.sign_getdefined() and 2 or 0
    local foldwidth = vim.wo.foldcolumn or 0

    -- subtract the number of empty spaces in your statuscol. I have
    -- four extra spaces in mine, to enhance readability for me
    local bufferwidth = winwidth - numberwidth - signwidth - foldwidth - 4

    -- fetch the line and calculate its display width
    local line = vim.fn.getline(vim.v.lnum)
    local line_length = vim.fn.strdisplaywidth(line)

    return math.floor(line_length / bufferwidth)
  end)

  return wrapped_lines
end

function CheckNumberingIsEnabled()
  return vim.wo.number or vim.wo.relativenumber
end

function CheckSymbolOrNumber(current)
  if vim.v.virtnum < 0 then
    return '-'
  end

  if vim.v.virtnum > 0 and (vim.wo.number or vim.wo.relativenumber) then
    local num_wraps = get_num_wraps()
    if vim.v.virtnum == num_wraps then
      return '└'
    else
      return '│'
    end
  end

  if current < 10 then
    return ' ' .. current
  end

  return current
end

vim.api.nvim_set_hl(0, 'LineNr0', { fg = '#dedede' })
vim.api.nvim_set_hl(0, 'LineNr1', { fg = '#bdbdbd' })
vim.api.nvim_set_hl(0, 'LineNr2', { fg = '#9c9c9c' })
vim.api.nvim_set_hl(0, 'LineNr3', { fg = '#7b7b7b' })
vim.api.nvim_set_hl(0, 'LineNr4', { fg = '#5a5a5a' })

-- vim.o.statuscolumn = '%s%=%#CursorLineNr#%{(v:relnum == 0)?v:lua.CheckSymbolOrNumber(v:lnum)."'
--   .. separator
--   .. '":""}'
--   .. '%#LineNr#%{(v:relnum != 0)?v:lua.CheckSymbolOrNumber(v:relnum)."'
--   .. separator
--   .. '":""}'

vim.o.statuscolumn = '%s%=%#LineNr4#%{(v:relnum >= 4 && v:lua.CheckNumberingIsEnabled())?v:lua.CheckSymbolOrNumber(v:relnum)."'
  .. separator
  .. '":""}'
  .. '%#LineNr3#%{(v:relnum == 3 && v:lua.CheckNumberingIsEnabled())?v:lua.CheckSymbolOrNumber(v:relnum)."'
  .. separator
  .. '":""}'
  .. '%#LineNr2#%{(v:relnum == 2 && v:lua.CheckNumberingIsEnabled())?v:lua.CheckSymbolOrNumber(v:relnum)."'
  .. separator
  .. '":""}'
  .. '%#LineNr1#%{(v:relnum == 1 && v:lua.CheckNumberingIsEnabled())?v:lua.CheckSymbolOrNumber(v:relnum)."'
  .. separator
  .. '":""}'
  .. '%#LineNr0#%{(v:relnum == 0 && v:lua.CheckNumberingIsEnabled())?v:lua.CheckSymbolOrNumber(v:lnum)." '
  .. separator
  .. '":""}'
