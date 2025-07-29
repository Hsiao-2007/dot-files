return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			"folke/lazydev.nvim",
			ft = "lua", -- only load on lua files
			opts = {
				library = {
					-- See the configuration section for more details
					-- Load luvit types when the `vim.uv` word is found
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
		{ -- optional blink completion source for require statements and module annotations
			"saghen/blink.cmp",
			build = 'cargo build --release',
			dependencies = {
				"L3MON4D3/LuaSnip",
				version = "v2.*",
				build = "make install_jsregexp",
				"rafamadriz/friendly-snippets"
			},
			opts = {
				snippets = { preset = 'luasnip' },
				sources = {
					-- add lazydev to your completion providers
					default = { "lazydev", "lsp", "path", "snippets", "buffer", "omni", "cmdline" },
					providers = {
						lazydev = {
							name = "LazyDev",
							module = "lazydev.integrations.blink",
							-- make lazydev completions top priority (see `:h blink.cmp`)
							score_offset = 100,
						},
					},
				},
				keymap = {
					preset = 'super-tab'
				},
			},
		}
	},
	config = function()
		require("luasnip.loaders.from_vscode").lazy_load()
		require("lspconfig").lua_ls.setup {}
		-- Install Clang
		require("lspconfig").ccls.setup {
			init_options = {
				compilationDatabaseDirectory = "build",
				init_options = {
					cache = {
						directory = ".ccls-cache",
					},
				},
				index = {
					threads = 0,
				},
				clang = {
					excludeArgs = { "-frounding-math" },
					extraArgs = { "--gcc-toolchain=/usr" },
				},
			}
		}
		-- Install dotnet-sdk, run donet tool install --global csharp_ls, and then add ~/.dotnet/tools to PATH
		vim.lsp.enable('csharp_ls')
		vim.lsp.enable('basedpyright')
		-- require("lspconfig").jdtls.setup {}
		vim.api.nvim_create_autocmd('LspAttach', {
			callback = function(args)
				local c = vim.lsp.get_client_by_id(args.data.client_id)
				if not c then return end

				if c.supports_method('textDocument_formatting') then
					-- Format the current buffer on save
					vim.api.nvim_create_autocmd('BufWritePre', {
						buffer = args.buf,
						callback = function()
							vim.lsp.buf.format({ bufnr = args.buf, id = c.id })
						end,
					})
				end
			end,
		})
	end,
}
