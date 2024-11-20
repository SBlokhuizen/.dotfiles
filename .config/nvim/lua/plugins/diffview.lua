return {
  {
    'sindrets/diffview.nvim',
    opts = {
      vim.keymap.set('n', '<leader>hv', ':DiffviewOpen<CR>', { desc = 'git diff [v]iew' }),
    },
  },
}
