return {
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      CustomOilBar = function()
        local path = vim.fn.expand '%'
        path = path:gsub('oil://', '')

        return '  ' .. vim.fn.fnamemodify(path, ':.')
      end

      require('oil').setup {
        columns = { 'icon' },
        keymaps = {
          ['<C-h>'] = false,
          ['<C-l>'] = false,
          ['<C-k>'] = false,
          ['<C-j>'] = false,
          ['<M-h>'] = 'actions.select_split',
          ['<C-p>'] = 'actions.preview',
        },
        win_options = {
          winbar = '%{v:lua.CustomOilBar()}',
        },
        view_options = {
          show_hidden = true,
        },
      }

      -- auto preview on cursor move (oil buffers only)
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'oil',
        callback = function()
          vim.api.nvim_create_autocmd('CursorMoved', {
            buffer = 0,
            callback = function()
              local ok, entry = pcall(require('oil').get_cursor_entry)
              if not ok or not entry then
                return
              end

              pcall(function()
                require('oil.actions').preview.callback()
              end)
            end,
          })
        end,
      })

      vim.keymap.set('n', '-', require('oil').toggle_float)
    end,
  },
}
