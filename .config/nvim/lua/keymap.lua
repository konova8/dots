-- [[ Basic Keymaps ]]
-- See `:help vim.keymap.set()`

-- Disable <Space> so that it won't interfere with leader key
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- NEVER PRESS Q AGAIN
vim.keymap.set('n', 'Q', '<nop>')

-- In visual mode move lines up and down with J and K
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Page up/down while staying in the middle of the screen
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')

-- Next and previus result stay in the middle of the screen
-- Then unfold what is under the cursor
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Better copy, pasting and deleting experience
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y')
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p')
vim.keymap.set({ 'n', 'v' }, '<leader>d', '"+d')
vim.keymap.set({ 'n', 'v' }, '<leader>x', '"+x')
vim.keymap.set({ 'n', 'v' }, '<leader>Y', '"+Y')

-- Format with builtin lsp
vim.keymap.set('n', '<leader>f', function()
    vim.lsp.buf.format()
    print('File formatted with vim.lsp.buf.format()')
end)

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Terminal Shortcuts
vim.keymap.set('n', '<C-`>', ':tabnew | startinsert | term<cr>')
vim.keymap.set('n', '<leader>`', ':botright split | resize 10 | startinsert | term<cr>')
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])
