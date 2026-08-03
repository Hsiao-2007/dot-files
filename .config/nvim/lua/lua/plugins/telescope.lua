return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = {
		'nvim-lua/plenary.nvim',
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		"nvim-telescope/telescope-file-browser.nvim"
	},
	config = function()
		require('telescope').setup {
			pickers    = {
				find_files = {
					find_command = { "rg", "--files", "--hidden" },
					file_ignore_patterns = { '.git' }
				},
			},
			defaults   = {
				vimgrep_arguments = {
					'rg',
					'--color=never',
					'--no-heading',
					'--with-filename',
					'--line-number',
					'--column',
					'--smart-case',
					'--hidden',
					'--glob',
					'!**/.git/*'
				},
				file_ignore_patterns = {
					"node_modules", "build", "dist", "yarn.lock"
				},
			},
			extensions = {
				file_browser = {
					-- disables netrw and use telescope-file-browser in its place
					hijack_netrw = true,
					depth = 2,
					hidden = true,
				},
			}
		}
	end
}
