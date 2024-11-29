local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

vim.keymap.set('n', '<leader>a', mark.add_file)
vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)

vim.keymap.set('n', '<M-S-k>', ui.nav_prev)
vim.keymap.set('n', '<M-S-j>', ui.nav_next)
