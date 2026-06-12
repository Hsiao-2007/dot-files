return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"saghen/blink.lib",
	},
	build = function()
		-- build the fuzzy matcher, wait up to 60 seconds
		-- you can use `gb` in `:Lazy` to rebuild the plugin as needed
		require('blink.cmp').build():wait(60000)
	end,
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- snippets = { preset = 'luasnip' },
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
				snippets = {
					opts = {
						extended_filetypes = {
							markdown = { 'jekyll' },
							sh = { 'shelldoc' },
							php = { 'phpdoc' },
							cpp = { 'unreal' }
						}
					}
				}
			},
		},
		keymap = {
			preset = 'super-tab'
		},
		fuzzy = { implementation = "rust" }
	}
}
