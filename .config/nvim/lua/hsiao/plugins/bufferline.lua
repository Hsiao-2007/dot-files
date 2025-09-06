return {
	'akinsho/bufferline.nvim',
	version = "*",
	dependencies = 'nvim-tree/nvim-web-devicons',
	config = function()
		require("bufferline").setup({
			options = {
				offsets = {
					{
						filetype = "NvimTree",
						text = "Files ",
						highlight = "Directory",
						separator = true -- use a "true" to enable the default, or set your own character
					}
				},
				hover = {
					enabled = true,
					delay = 200,
					reveal = { 'close' }
				}
			}
		})
	end
}
