-- ~/.config/nvim/lua/plugins/lang-db.lua
return {
	{ 'tpope/vim-dadbod' },
	{
		'kristijanhusak/vim-dadbod-ui',
		dependencies = { 'kristijanhusak/vim-dadbod-completion' },
		cmd = { 'DBUI', 'DBUIToggle', 'DBUIAddConnection', 'DBUIFindBuffer' },
		config = function()
			vim.g.db_ui_use_nerd_fonts = 1
		end,
	},
}
