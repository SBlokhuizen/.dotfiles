return {
  {
    'sindrets/diffview.nvim',
    config = function()
      require('diffview').setup {
        view = {
          merge_tool = {
            layout = 'diff3_mixed',
          },
        },
      }
      vim.keymap.set('n', '<leader>hv', ':DiffviewOpen<CR>', { desc = 'git diff [v]iew' })
    end,
  },
}
