-- ~/.config/nvim/lua/core/keymaps.lua
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

local opts = { noremap = true, silent = true }

-- File operations
vim.keymap.set('n', '<C-q>', '<cmd>q<CR>', opts)
vim.keymap.set('n', '<C-w>', '<cmd>wq<CR>', opts)
vim.keymap.set('n', '<C-s>', '<cmd>w<CR>', opts)
vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w<CR>', opts) -- save without formatting

-- Scrolling
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- Line wrapping toggle
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)

-- Indent in visual mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Window management
vim.keymap.set('n', '<leader>v', '<C-w>v', opts)      -- vertical split
vim.keymap.set('n', '<leader>h', '<C-w>s', opts)      -- horizontal split
vim.keymap.set('n', '<leader>se', '<C-w>=', opts)     -- equal size
vim.keymap.set('n', '<leader>xs', ':close<CR>', opts) -- close split

-- Navigate splits with Ctrl + hjkl
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Resize splits with Alt + arrow keys (or Alt + hjkl)
vim.keymap.set('n', '<A-k>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<A-j>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<A-h>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<A-l>', ':vertical resize +2<CR>', opts)

-- Tabs
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', opts)
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', opts)
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', opts)
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', opts)
