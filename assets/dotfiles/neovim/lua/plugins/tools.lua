-- ~/.config/nvim/lua/plugins/tools.lua
return {
	-- Telescope
	{
		'nvim-telescope/telescope.nvim',
		event = 'VimEnter',
		branch = '0.1.x',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				build = 'make',
				cond = function() return vim.fn.executable 'make' == 1 end,
			},
			{ 'nvim-telescope/telescope-ui-select.nvim' },
			{ 'nvim-tree/nvim-web-devicons',            enabled = vim.g.have_nerd_font },
		},
		config = function()
			require('telescope').setup {
				pickers = {
					find_files = { file_ignore_patterns = { 'node_modules', '.git', '.venv' }, hidden = true },
					live_grep = {
						file_ignore_patterns = { 'node_modules', '.git', '.venv' },
						additional_args = function() return { '--hidden' } end,
					},
				},
				extensions = {
					['ui-select'] = { require('telescope.themes').get_dropdown() },
				},
			}
			pcall(require('telescope').load_extension, 'fzf')
			pcall(require('telescope').load_extension, 'ui-select')

			local builtin = require 'telescope.builtin'
			vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
			vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
			vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
			vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
			vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
			vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
			vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
			vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
			vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files' })
			vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

			vim.keymap.set('n', '<leader>/', function()
				builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown { winblend = 10, previewer = false })
			end, { desc = '[/] Fuzzily search in current buffer' })

			vim.keymap.set('n', '<leader>s/', function()
				builtin.live_grep { grep_open_files = true, prompt_title = 'Live Grep in Open Files' }
			end, { desc = '[S]earch [/] in Open Files' })

			vim.keymap.set('n', '<leader>sn', function()
				builtin.find_files { cwd = vim.fn.stdpath 'config' }
			end, { desc = '[S]earch [N]eovim files' })
		end,
	},

	-- Trouble (diagnostics panel)
	{
		'folke/trouble.nvim',
		opts = {},
		cmd = 'Trouble',
		keys = {
			{ '<leader>xx', '<cmd>Trouble diagnostics toggle<CR>',              desc = 'Diagnostics (Trouble)' },
			{ '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<CR>', desc = 'Buffer Diagnostics (Trouble)' },
			{ '<leader>cs', '<cmd>Trouble symbols toggle<CR>',                  desc = 'Symbols (Trouble)' },
		},
	},

	-- Which-key
	{
		'folke/which-key.nvim',
		event = 'VeryLazy',
		config = true,
	},

	-- Todo comments
	{
		'folke/todo-comments.nvim',
		event = 'VimEnter',
		dependencies = { 'nvim-lua/plenary.nvim' },
		opts = { signs = false },
	},

	-- Color highlighter
	{
		'NvChad/nvim-colorizer.lua',
		config = function()
			require('colorizer').setup({
				-- (optional) your custom settings, or leave empty for defaults
			})
		end,
	},

	-- Neo-tree
	{
		'nvim-neo-tree/neo-tree.nvim',
		branch = 'v3.x',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-tree/nvim-web-devicons',
			'MunifTanjim/nui.nvim',
			{ '3rd/image.nvim', optional = true },
			{
				's1n7ax/nvim-window-picker',
				version = '2.*',
				config = function()
					require('window-picker').setup {
						filter_rules = {
							include_current_win = false,
							autoselect_one = true,
							bo = { filetype = { 'neo-tree', 'neo-tree-popup', 'notify' }, buftype = { 'terminal', 'quickfix' } },
						},
					}
				end,
			},
		},
		config = function()
			vim.fn.sign_define('DiagnosticSignError', { text = ' ', texthl = 'DiagnosticSignError' })
			vim.fn.sign_define('DiagnosticSignWarn', { text = ' ', texthl = 'DiagnosticSignWarn' })
			vim.fn.sign_define('DiagnosticSignInfo', { text = ' ', texthl = 'DiagnosticSignInfo' })
			vim.fn.sign_define('DiagnosticSignHint', { text = '󰌵', texthl = 'DiagnosticSignHint' })

			require('neo-tree').setup {
				close_if_last_window = false,
				popup_border_style = 'rounded',
				enable_git_status = true,
				enable_diagnostics = true,
				sort_case_insensitive = false,
				default_component_configs = {
					container = { enable_character_fade = true },
					indent = {
						indent_size = 2, padding = 1,
						with_markers = true, indent_marker = '│', last_indent_marker = '└',
						highlight = 'NeoTreeIndentMarker',
						with_expanders = nil, expander_collapsed = '', expander_expanded = '',
						expander_highlight = 'NeoTreeExpander',
					},
					icon = { folder_closed = '', folder_open = '', folder_empty = '󰜌', default = '*', highlight = 'NeoTreeFileIcon' },
					modified = { symbol = '[+]', highlight = 'NeoTreeModified' },
					name = { trailing_slash = false, use_git_status_colors = true, highlight = 'NeoTreeFileName' },
					git_status = {
						symbols = {
							added = '', modified = '', deleted = '✖', renamed = '󰁕',
							untracked = '', ignored = '', unstaged = '󰄱', staged = '', conflict = '',
						},
					},
					file_size = { enabled = true, required_width = 64 },
					type = { enabled = true, required_width = 122 },
					last_modified = { enabled = true, required_width = 88 },
					created = { enabled = true, required_width = 110 },
				},
				window = {
					position = 'left', width = 40,
					mapping_options = { noremap = true, nowait = true },
					mappings = {
						['<space>'] = { 'toggle_node', nowait = false },
						['<2-LeftMouse>'] = 'open',
						['<cr>'] = 'open',
						['<esc>'] = 'cancel',
						['P'] = { 'toggle_preview', config = { use_float = true } },
						['l'] = 'open', ['S'] = 'open_split', ['s'] = 'open_vsplit', ['t'] = 'open_tabnew',
						['w'] = 'open_with_window_picker',
						['C'] = 'close_node', ['z'] = 'close_all_nodes',
						['a'] = { 'add', config = { show_path = 'none' } },
						['A'] = 'add_directory', ['d'] = 'delete', ['r'] = 'rename',
						['y'] = 'copy_to_clipboard', ['x'] = 'cut_to_clipboard', ['p'] = 'paste_from_clipboard',
						['c'] = 'copy', ['m'] = 'move', ['q'] = 'close_window', ['R'] = 'refresh',
						['?'] = 'show_help', ['<'] = 'prev_source', ['>'] = 'next_source', ['i'] = 'show_file_details',
					},
				},
				filesystem = {
					filtered_items = {
						visible = false,
						hide_dotfiles = false,
						hide_gitignored = false,
						hide_hidden = false,
						hide_by_name = { '.DS_Store', 'thumbs.db', 'node_modules', '__pycache__', '.virtual_documents', '.git', '.python-version', '.venv' },
						never_show = {},
					},
					follow_current_file = { enabled = false, leave_dirs_open = false },
					group_empty_dirs = false,
					hijack_netrw_behavior = 'open_default',
					use_libuv_file_watcher = false,
					window = {
						mappings = {
							['<bs>'] = 'navigate_up',
							['.'] = 'set_root',
							['H'] = 'toggle_hidden',
							['/'] = 'fuzzy_finder',
							['D'] = 'fuzzy_finder_directory',
							['#'] = 'fuzzy_sorter',
							['f'] = 'filter_on_submit',
							['<c-x>'] = 'clear_filter',
							['[g'] = 'prev_git_modified', [']g'] = 'next_git_modified',
							['o'] = { 'show_help', nowait = false, config = { title = 'Order by', prefix_key = 'o' } },
							['oc'] = { 'order_by_created', nowait = false },
							['od'] = { 'order_by_diagnostics', nowait = false },
							['og'] = { 'order_by_git_status', nowait = false },
							['om'] = { 'order_by_modified', nowait = false },
							['on'] = { 'order_by_name', nowait = false },
							['os'] = { 'order_by_size', nowait = false },
							['ot'] = { 'order_by_type', nowait = false },
						},
					},
				},
				buffers = {
					follow_current_file = { enabled = true, leave_dirs_open = false },
					group_empty_dirs = true,
					show_unloaded = true,
					window = {
						mappings = {
							['bd'] = 'buffer_delete',
							['<bs>'] = 'navigate_up', ['.'] = 'set_root',
							['o'] = { 'show_help', nowait = false, config = { title = 'Order by', prefix_key = 'o' } },
							['oc'] = { 'order_by_created', nowait = false },
							['od'] = { 'order_by_diagnostics', nowait = false },
							['om'] = { 'order_by_modified', nowait = false },
							['on'] = { 'order_by_name', nowait = false },
							['os'] = { 'order_by_size', nowait = false },
							['ot'] = { 'order_by_type', nowait = false },
						},
					},
				},
				git_status = {
					window = {
						position = 'float',
						mappings = {
							['A'] = 'git_add_all', ['gu'] = 'git_unstage_file', ['ga'] = 'git_add_file',
							['gr'] = 'git_revert_file', ['gc'] = 'git_commit', ['gp'] = 'git_push',
							['gg'] = 'git_commit_and_push',
						},
					},
				},
			}
			vim.keymap.set('n', '\\', ':Neotree toggle position=left<CR>', { noremap = true, silent = true })
		end,
	},
}
