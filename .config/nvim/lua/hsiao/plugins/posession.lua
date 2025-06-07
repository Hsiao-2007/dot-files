return {
	"jedrzejboczar/possession.nvim",
	config = function()
		require('possession').setup {
			commands = {
				save = 'SSave',
				load = 'SLoad',
				delete = 'SDelete',
				list = 'SList',
			}
		}
	end
}
