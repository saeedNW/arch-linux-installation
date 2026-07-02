-- ~/.config/nvim/lua/plugins/coding.lua
return {
	-- Treesitter
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		opts = {
			ensure_installed = {
				'lua', 'python', 'javascript', 'typescript', 'vimdoc', 'vim', 'regex',
				'terraform', 'sql', 'dockerfile', 'toml', 'json', 'java', 'groovy', 'go',
				'gitignore', 'graphql', 'yaml', 'make', 'cmake', 'markdown', 'markdown_inline',
				'bash', 'tsx', 'css', 'html',
			},
			auto_install = true,
			highlight = { enable = true, additional_vim_regex_highlighting = { 'ruby' } },
			indent = { enable = true, disable = { 'ruby' } },
		},
	},

	-- LSP & Mason
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			{ 'williamboman/mason.nvim', config = true },
			'williamboman/mason-lspconfig.nvim',
			'WhoIsSethDaniel/mason-tool-installer.nvim',
			{ 'j-hui/fidget.nvim',       opts = {} },
			'hrsh7th/cmp-nvim-lsp',
		},
		config = function()
			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc, mode)
						mode = mode or 'n'
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
					end

					map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
					map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
					map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
					map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
					map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
					map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
					map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
					map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
					map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
						local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
						vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})
						vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})
					end

					if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
						map('<leader>th', function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
						end, '[T]oggle Inlay [H]ints')
					end
				end,
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

			local servers = {
				ts_ls = {},
				pylsp = {
					settings = {
						pylsp = {
							plugins = {
								pyflakes = { enabled = false },
								pycodestyle = { enabled = false },
								autopep8 = { enabled = false },
								yapf = { enabled = false },
								mccabe = { enabled = false },
								pylsp_mypy = { enabled = false },
								pylsp_black = { enabled = false },
								pylsp_isort = { enabled = false },
							},
						},
					},
				},
				html = { filetypes = { 'html', 'twig', 'hbs' } },
				cssls = {},
				tailwindcss = {},
				dockerls = {},
				sqlls = {},
				terraformls = {},
				jsonls = {},
				yamlls = {},
				lua_ls = {
					settings = {
						Lua = {
							completion = { callSnippet = 'Replace' },
							runtime = { version = 'LuaJIT' },
							workspace = {
								checkThirdParty = false,
								library = { '${3rd}/luv/library', unpack(vim.api.nvim_get_runtime_file('', true)) },
							},
							diagnostics = { disable = { 'missing-fields' } },
							format = { enable = false },
						},
					},
				},
			}

			require('mason').setup()
			local ensure_installed = vim.tbl_keys(servers)
			vim.list_extend(ensure_installed, {
				'stylua', -- Lua formatter
				'prettierd', -- JS/TS/CSS formatter
				'eslint_d', -- JS/TS linter
				'black', -- Python formatter
				'isort', -- Python import sorting
			})
			require('mason-tool-installer').setup { ensure_installed = ensure_installed }

			require('mason-lspconfig').setup {
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
						require('lspconfig')[server_name].setup(server)
					end,
				},
			}
		end,
	},

	-- Autocompletion
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			{
				'L3MON4D3/LuaSnip',
				build = (function()
					if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then return end
					return 'make install_jsregexp'
				end)(),
				dependencies = {
					{
						'rafamadriz/friendly-snippets',
						config = function()
							require('luasnip.loaders.from_vscode').lazy_load()
						end,
					},
				},
			},
			'saadparwaiz1/cmp_luasnip',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
		},
		config = function()
			local cmp = require 'cmp'
			local luasnip = require 'luasnip'
			luasnip.config.setup {}

			local kind_icons = {
				Text = '󰉿',
				Method = 'm',
				Function = '󰊕',
				Constructor = '',
				Field = '',
				Variable = '󰆧',
				Class = '󰌗',
				Interface = '',
				Module = '',
				Property = '',
				Unit = '',
				Value = '󰎠',
				Enum = '',
				Keyword = '󰌋',
				Snippet = '',
				Color = '󰏘',
				File = '󰈙',
				Reference = '',
				Folder = '󰉋',
				EnumMember = '',
				Constant = '󰇽',
				Struct = '',
				Event = '',
				Operator = '󰆕',
				TypeParameter = '󰊄',
			}

			cmp.setup {
				snippet = {
					expand = function(args) luasnip.lsp_expand(args.body) end,
				},
				completion = { completeopt = 'menu,menuone,noinsert' },
				mapping = cmp.mapping.preset.insert {
					['<C-n>'] = cmp.mapping.select_next_item(),
					['<C-p>'] = cmp.mapping.select_prev_item(),
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-y>'] = cmp.mapping.confirm { select = true },
					['<C-Space>'] = cmp.mapping.complete {},
					['<Tab>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { 'i', 's' }),
					['<S-Tab>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { 'i', 's' }),
				},
				sources = {
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' },
					{ name = 'buffer' },
					{ name = 'path' },
				},
				formatting = {
					fields = { 'kind', 'abbr', 'menu' },
					format = function(entry, vim_item)
						vim_item.kind = string.format('%s', kind_icons[vim_item.kind])
						vim_item.menu = ({
							nvim_lsp = '[LSP]',
							luasnip = '[Snippet]',
							buffer = '[Buffer]',
							path = '[Path]',
						})[entry.source.name]
						return vim_item
					end,
				},
			}
		end,
	},

	-- Formatting
	{
		'stevearc/conform.nvim',
		event = { 'BufWritePre' },
		cmd = { 'ConformInfo' },
		keys = {
			{
				'<leader>f',
				function()
					require('conform').format { async = true, lsp_fallback = true }
				end,
				desc = '[F]ormat buffer',
			},
		},
		config = function()
			require('conform').setup {
				formatters_by_ft = {
					lua = { 'stylua' },
					javascript = { 'prettierd' },
					typescript = { 'prettierd' },
					javascriptreact = { 'prettierd' },
					typescriptreact = { 'prettierd' },
					css = { 'prettierd' },
					html = { 'prettierd' },
					python = { 'black', 'isort' },
				},
				format_on_save = function(bufnr)
					-- Disable with a global or buffer-local variable: vim.g.disable_autoformat or vim.b.disable_autoformat
					if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
						return
					end
					return { timeout_ms = 2000, lsp_fallback = true }
				end,
			}
			-- Toggle autoformatting with <leader>uf
			vim.api.nvim_create_user_command('FormatToggle', function()
				vim.g.disable_autoformat = not vim.g.disable_autoformat
				print(vim.g.disable_autoformat and 'Autoformat OFF' or 'Autoformat ON')
			end, {})
			vim.keymap.set('n', '<leader>uf', '<cmd>FormatToggle<CR>', { desc = 'Toggle autoformat' })
		end,
	},

	-- Linting
	{
		'mfussenegger/nvim-lint',
		event = { 'BufReadPost', 'BufNewFile' },
		config = function()
			local lint = require 'lint'
			lint.linters_by_ft = {
				javascript = { 'eslint_d' },
				typescript = { 'eslint_d' },
				javascriptreact = { 'eslint_d' },
				typescriptreact = { 'eslint_d' },
				python = { 'ruff' },
			}
			vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufReadPost', 'InsertLeave' }, {
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
}
