-- ~/.config/nvim/lua/plugins/ui.lua
return {
	-- Colorscheme
	{
		'shaunsingh/nord.nvim',
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.nord_contrast = true
			vim.g.nord_borders = false
			vim.g.nord_disable_background = false
			vim.g.nord_italic = false
			vim.g.nord_uniform_diff_background = true
			vim.g.nord_bold = false
			require('nord').set()
		end
	},
	-- Bufferline
	{
		'akinsho/bufferline.nvim',
		dependencies = { 'moll/vim-bbye', 'nvim-tree/nvim-web-devicons' },
		config = function()
			require('bufferline').setup {
				options = {
					mode = 'buffers',
					themable = true,
					numbers = 'none',
					close_command = 'Bdelete! %d',
					buffer_close_icon = '✗',
					close_icon = '✗',
					path_components = 1,
					modified_icon = '●',
					left_trunc_marker = '',
					right_trunc_marker = '',
					max_name_length = 30,
					max_prefix_length = 30,
					tab_size = 21,
					diagnostics = false,
					diagnostics_update_in_insert = false,
					color_icons = true,
					show_buffer_icons = true,
					show_buffer_close_icons = true,
					show_close_icon = true,
					persist_buffer_sort = true,
					separator_style = { '│', '│' },
					enforce_regular_tabs = true,
					always_show_bufferline = true,
					show_tab_indicators = false,
					indicator = { style = 'none' },
					icon_pinned = '󰐃',
					minimum_padding = 1,
					maximum_padding = 5,
					maximum_length = 15,
					sort_by = 'insert_at_end',
				},
				highlights = {
					separator = { fg = '#434C5E' },
					buffer_selected = { bold = true, italic = false },
				}
			}
		end
	},
	-- Lualine
	{
		'nvim-lualine/lualine.nvim',
		config = function()
			local mode = {
				'mode',
				fmt = function(str) return ' ' .. str end
			}
			local filename = {
				'filename',
				file_status = true,
				path = 0
			}
			local hide_in_width = function()
				return vim.fn.winwidth(0) > 100
			end
			local diagnostics = {
				'diagnostics',
				sources = { 'nvim_diagnostic' },
				sections = { 'error', 'warn' },
				symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
				colored = false,
				update_in_insert = false,
				always_visible = false,
				cond = hide_in_width,
			}
			local diff = {
				'diff',
				colored = false,
				symbols = { added = ' ', modified = ' ', removed = ' ' },
				cond = hide_in_width,
			}
			require('lualine').setup {
				options = {
					icons_enabled = true,
					theme = 'nord',
					section_separators = { left = '', right = '' },
					component_separators = { left = '', right = '' },
					disabled_filetypes = { 'alpha', 'neo-tree' },
					always_divide_middle = true,
				},
				sections = {
					lualine_a = { mode },
					lualine_b = { 'branch' },
					lualine_c = { filename },
					lualine_x = { diagnostics, diff, { 'encoding', cond = hide_in_width }, { 'filetype', cond = hide_in_width } },
					lualine_y = { 'location' },
					lualine_z = { 'progress' },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { { 'filename', path = 1 } },
					lualine_x = { { 'location', padding = 0 } },
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {},
				extensions = { 'fugitive' },
			}
		end
	},
	-- Alpha dashboard
	{
		'goolord/alpha-nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			local alpha = require 'alpha'
			local dashboard = require 'alpha.themes.startify'
			dashboard.section.header.val = {
				[[                                                    ]],
				[[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
				[[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
				[[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
				[[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
				[[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
				[[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
				[[                                                    ]],
			}
			alpha.setup(dashboard.opts)
		end
	},
	-- Status column (gutter)
	{
		'luukvbaal/statuscol.nvim',
		config = function()
			local builtin = require 'statuscol.builtin'
			require('statuscol').setup {
				relculright = true,
				segments = {
					{ text = { builtin.foldfunc },      click = 'v:lua.ScFa' },
					{ text = { '%s' },                  click = 'v:lua.ScSa' },
					{ text = { builtin.lnumfunc, ' ' }, click = 'v:lua.ScLa' },
				},
			}
		end
	},
}
