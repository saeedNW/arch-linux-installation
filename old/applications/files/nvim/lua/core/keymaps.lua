-- Set leader key
vim.g.mapleader = ' ' -- Set <Space> as the leader key
vim.g.maplocalleader = ' ' -- Set <Space> as the local leader key

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({'n', 'v'}, '<Space>', '<Nop>', {
    silent = true
})

-- For conciseness, we can use the `opts` variable to store common options
local opts = {
    noremap = true,
    silent = true
}

-- Set up keybindings for quitting the file with <Ctrl+q>
vim.keymap.set('n', '<C-q>', '<cmd> q <CR>', opts)

-- Set up keybindings for saving and quitting the file with <Ctrl+w>
vim.keymap.set('n', '<C-w>', '<cmd> wq <CR>', opts)

-- Set up keybindings for saving the file with <Ctrl+s>
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', opts)

-- Set up keybindings for saving the file without triggering auto-formatting
vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w <CR>', opts)

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- Toggle line wrapping
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Window management
vim.keymap.set('n', '<leader>v', '<C-w>v', opts) -- split window vertically
vim.keymap.set('n', '<leader>h', '<C-w>s', opts) -- split window horizontally
vim.keymap.set('n', '<leader>se', '<C-w>=', opts) -- make split windows equal width & height
vim.keymap.set('n', '<leader>xs', ':close<CR>', opts) -- close current split window

-- Navigate between splits
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

-- Resize with arrows
vim.keymap.set('n', 'k', ':resize -2<CR>', opts)
vim.keymap.set('n', 'j', ':resize +2<CR>', opts)
vim.keymap.set('n', 'h', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', 'l', ':vertical resize +2<CR>', opts)

-- Tabs
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', opts) -- open new tab
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', opts) -- close current tab
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', opts) --  go to next tab
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', opts) --  go to previous tab
