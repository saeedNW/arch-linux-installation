-- ~/.config/nvim/lua/plugins/terminal.lua
return {
	{
		'akinsho/toggleterm.nvim',
		version = '*',
		config = true,
		keys = {
			{ '<C-\\>', '<cmd>ToggleTerm<CR>',                 desc = 'Toggle terminal' },
			{ '<C-t>',  '<cmd>ToggleTerm direction=float<CR>', desc = 'Float terminal' },
		},
	},
}
