return {
	"igorlfs/nvim-dap-view",
	dependencies = { "mfussenegger/nvim-dap" },
	config = function()
		require('dap-view').setup({
			windows = {
				size = 0.25,
				position = "right",
				terminal = {
					size = 0.5,
					position = "left",
					-- List of debug adapters for which the terminal should be ALWAYS hidden
					-- Can also be set to "true" to never show the terminal
					hide = {},
				},
			},
		})
	end
}
