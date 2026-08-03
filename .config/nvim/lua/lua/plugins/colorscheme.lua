return {
	"olimorris/onedarkpro.nvim",
	priority = 1000,
	config = function()
		require("onedarkpro").setup({
			options = {
				transparency = true,
				ualine_transparency = false
			}
		})
		vim.cmd.colorscheme "onedark"
	end,
	-- {
	-- 	"scottmckendry/cyberdream.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("cyberdream").setup({
	-- 			transparent = false,
	-- 		})
	-- 		vim.cmd.colorscheme "cyberdream"
	-- 	end,
	-- }
}
