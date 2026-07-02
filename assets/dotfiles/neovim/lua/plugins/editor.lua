-- ~/.config/nvim/lua/plugins/editor.lua
return {
	-- Detect tabstop and shiftwidth automatically
	{ 'tpope/vim-sleuth' },

	-- Autoclose pairs
	{
		'windwp/nvim-autopairs',
		event = 'InsertEnter',
		config = true,
		opts = {},
	},

	-- Commenting
	{
		'numToStr/Comment.nvim',
		config = true,
		keys = {
			{ 'gc', mode = { 'n', 'v' } },
			{ 'gb', mode = { 'n', 'v' } },
		},
	},

	-- Surround
	{
		'kylechui/nvim-surround',
		version = '*',
		event = 'VeryLazy',
		config = true,
	},

	-- Indent guides
	{
		'lukas-reineke/indent-blankline.nvim',
		main = 'ibl',
		opts = {
			indent = { char = '▏' },
			scope = { show_start = false, show_end = false, show_exact_scope = false },
			exclude = {
				filetypes = { 'help', 'startify', 'dashboard', 'packer', 'neogitstatus', 'NvimTree', 'Trouble' },
			},
		},
	},
}
