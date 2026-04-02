return {
  'SBlokhuizen/rst-preview.nvim',
  cmd = { 'RSTPreview', 'RSTPreviewStop', 'RSTPreviewToggle' },
  build = 'cd app && npm install && cp node_modules/socket.io-client/dist/socket.io.js _static/socket.io.min.js',
  init = function()
    vim.g.rstpvw_filetypes = { 'rst' }
  end,
  ft = { 'rst' },
  keys = {
    { '<leader>p', '<cmd>RSTPreviewToggle<cr>', ft = 'rst', desc = 'Toggle RST Preview' },
  },
}
