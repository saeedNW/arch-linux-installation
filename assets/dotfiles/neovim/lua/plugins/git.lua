-- ~/.config/nvim/lua/plugins/git.lua
return {
	-- Git signs
	{
		'lewis6991/gitsigns.nvim',
		opts = {
			signs = {
				add = { text = '+' },
				change = { text = '~' },
				delete = { text = '_' },
				topdelete = { text = '‾' },
				changedelete = { text = '~' },
			},
			signs_staged = {
				add = { text = '+' },
				change = { text = '~' },
				delete = { text = '_' },
				topdelete = { text = '‾' },
				changedelete = { text = '~' },
			},
		},
	},
	-- Fugitive (Git commands inside Neovim)
	{ 'tpope/vim-fugitive' },
	{ 'tpope/vim-rhubarb' },
}
