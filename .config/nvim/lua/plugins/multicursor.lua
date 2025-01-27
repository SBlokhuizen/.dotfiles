return {
  {
    'mg979/vim-visual-multi',
    branch = 'master',
    config = function()
      vim.keymap.set('n', '<C-k>', '<Plug>(VM-Add-Cursor-Up)')
      vim.keymap.set('n', '<C-j>', '<Plug>(VM-Add-Cursor-Down)')
    end,
  },
}
