return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = { 'nvim-lua/plenary.nvim' },
	setup = {
		pickers = {
			find_files = {
				hidden = true
			}
		},
		defaults = {
			vimgrep_arguments = {
				'rg',
				'--color=never',
				'--no-heading',
				'--with-filename',
				'--line-number',
				'--column',
				'--smart-case',
				'--hidden',
			},
			file_ignore_patterns = {
				"node_modules", "build", "dist", "yarn.lock"
			},
		}
	}
}
