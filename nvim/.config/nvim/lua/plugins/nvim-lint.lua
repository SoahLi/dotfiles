return {
  'mfussenegger/nvim-lint',
  event = {
    'BufReadPre',
    'BufNewFile',
  },
  config = function()
    local lint = require('lint')

    lint.linters_by_ft = {
      typescript = { 'eslint_d' },
    }

    -- Run on save and on buffer read (as before)
    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
      callback = function()
        lint.try_lint()
      end,
    })

    -- ALSO run on text change or leaving insert mode
    vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set('n', '<leader>l', function()
      lint.try_lint()
    end, { desc = 'Trigger linting for current file' })
  end
}
