return {
  {
    'Mofiqul/vscode.nvim',
    priority = 1000,
    config = function()
      vim.cmd [[colorscheme vscode]]
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
