require('telescope').setup({
  defaults = {
    sorting_strategy = 'ascending',
    layout_strategy = 'vertical',
    layout_config = {
      width = 0.95,
      height = 0.95,
      mirror = true
    }
  },
  pickers = {
    buffers = {
      initial_mode = "normal"
    },
    grep_string = {
      initial_mode = "normal"
    }
  }
})

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>o', builtin.git_files, {})
vim.keymap.set('n', '<leader>f', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

vim.keymap.set('n', '<leader>*', builtin.grep_string, {})
vim.keymap.set('n', '<leader>G', builtin.git_branches, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
