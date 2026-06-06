-- ~/.config/nvim/lua/plugins/lang-js.lua
return {
	-- Improved TypeScript tools (organize imports, rename file, etc.)
	{
		'pmizio/typescript-tools.nvim',
		dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
		ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
		opts = {},
	},
	-- Package.json version info
	{
		'vuki656/package-info.nvim',
		dependencies = { 'MunifTanjim/nui.nvim' },
		ft = 'json',
		config = true,
	},
	-- Tailwind (optional, only if you use Tailwind CSS)
	{
		'luckasRanarison/tailwind-tools.nvim',
		ft = { 'html', 'css', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue' },
		opts = {},
	},
}
