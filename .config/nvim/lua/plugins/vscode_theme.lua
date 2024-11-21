return {
  {
    'Mofiqul/vscode.nvim',
    priority = 1000,
    config = function()
      vim.cmd [[colorscheme vscode]]

      -- Override diff colors
      -- vim.api.nvim_set_hl(0, 'DiffAdd', { bg = '#26332c', fg = nil })
      vim.api.nvim_set_hl(0, 'DiffChange', { bg = '#1c3448', fg = nil })
      -- vim.api.nvim_set_hl(0, 'DiffDelete', { bg = '#3f2d2d', fg = nil })
      vim.api.nvim_set_hl(0, 'DiffText', { bg = '#365d78', fg = nil })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
