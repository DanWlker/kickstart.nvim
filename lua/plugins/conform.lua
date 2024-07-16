return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- local disable_filetypes = { c = true, cpp = true }
      local disable_filetypes = {}
      if disable_filetypes[vim.bo[bufnr].filetype] then
        return nil
      else
        return {
          timeout_ms = 500,
          lsp_format = 'fallback',
        }
      end
    end,
    formatters = {
      sqlfluff = {
        args = { 'format', '--dialect=ansi', '-' },
      },
      ['markdown-toc'] = {
        condition = function(_, ctx)
          for _, line in ipairs(vim.api.nvim_buf_get_lines(ctx.buf, 0, -1, false)) do
            if line:find '<!%-%- toc %-%->' then
              return true
            end
          end
        end,
      },
      ['markdownlint-cli2'] = {
        condition = function(_, ctx)
          local diag = vim.tbl_filter(function(d)
            return d.source == 'markdownlint'
          end, vim.diagnostic.get(ctx.buf))
          return #diag > 0
        end,
      },
      prettier = { require_cwd = true },
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      -- python = { 'isort', 'black' },
      javascript = { 'prettierd', 'prettier', stop_after_first = true },
      json = { 'jq' },
      c = { 'clang-format' },
      -- go = { 'goimports', 'gofumpt' }, --lsp handled, slows down gopls if configured here
      sql = { 'sqlfluff' },
      mysql = { 'sqlfluff' },
      plsql = { 'sqlfluff' },
      markdown = { 'prettier', 'markdownlint-cli2', 'markdown-toc' },
      ['markdown.mdx'] = { 'prettier', 'markdownlint-cli2', 'markdown-toc' },
    },
  },
}
