return {
  {
    'kkoomen/vim-doge',
    build = ':call doge#install()', -- Ensures Doge is fully installed
    config = function()
      vim.g.doge_doc_standard_python = 'google' -- Set the documentation style to Google
    end,
  },
}
