return {
	'echasnovski/mini.statusline',
	dependencies = {
		{ "nvim-tree/nvim-web-devicons", opts = {} },
	},
	config = function()
		local statusline = require 'mini.statusline'
		statusline.setup {
			use_icons = true,

		}
	end
}
