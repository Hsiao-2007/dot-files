-- Navigation
-- vim.keymap.set("n", "<leader>z", vim.cmd.Ex, { desc = "open backup file tree" })
vim.keymap.set("n", "<tab>", "<cmd>bnext<CR>", { desc = "change tab" })
vim.keymap.set("n", "<leader>x", "<cmd>bd<CR> <bar> <cmd>bl<CR>", { desc = "close current tab" })

-- Telescope
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope.find_files, { desc = 'telescope find files' })
vim.keymap.set("n", "<space>ft",
	function()
		local first_arg = vim.v.argv[3]
		local telescope_local = require("telescope")
		if first_arg and vim.fn.isdirectory(first_arg) == 1 then
			vim.defer_fn(function()
				telescope_local.extensions.file_browser.file_browser({ path = first_arg })
			end, 100)
		elseif first_arg and vim.fn.filereadable(first_arg) then
			local path = vim.fn.fnamemodify(first_arg, ":p:h")
			vim.defer_fn(function()
				telescope_local.extensions.file_browser.file_browser({ path = path })
			end, 100)
		end
	end,
	{ desc = "telescope file browser" })
vim.keymap.set('n', '<leader>fg', telescope.live_grep, { desc = 'telescope live grep' })
vim.keymap.set('n', '<leader>fb', telescope.buffers, { desc = 'telescope buffers' })
vim.keymap.set('n', '<leader>fh', telescope.help_tags, { desc = 'telescope help tags' })

-- System clipboard
vim.keymap.set('v', '<leader>y', '"+y', { desc = "copy to system clip" })
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p', { desc = "paste from system clip" })


-- Diagnostic
vim.keymap.set('n', '<leader>d',
	function()
		if vim.diagnostic.is_enabled() then
			vim.diagnostic.enable(false, nil)
		else
			vim.diagnostic.enable(true, nil)
		end
	end,
	{ desc = "toggle diagnostic text" }
)

vim.keymap.set('n', '<leader>s', "<cmd>lua require('clean-diagnostic').show()<cr>",
	{ desc = "show the diagnostic of the current line" })

-- Utilities
vim.keymap.set('n', '<leader>t',
	function()
		local current = require("onedarkpro.config").config.options.transparency
		require("onedarkpro").setup({
			options = {
				transparency = not current
			}
		})
		vim.cmd("colorscheme onedark")
		-- require("cyberdream").setup({
		-- 	transparent = not vim.g.cyberdream_opts.transparent
		-- })
		-- vim.cmd.colorscheme "cyberdream"
	end,
	{ desc = "toggle transparency" })

vim.keymap.set('n', '<leader>l', function()
		require("lazy").show()
	end,
	{ desc = "open lazy" }
)

vim.keymap.set('n', '<leader>b',
	function()
		if vim.o.showtabline == 2 then
			vim.o.showtabline = 0
		else
			vim.o.showtabline = 2
		end
	end,
	{ desc = "toggle buffers" }
)

vim.keymap.set('n', '<leader>n',
	function()
		if vim.o.relativenumber then
			vim.o.relativenumber = false
		else
			vim.o.relativenumber = true
		end
	end,
	{ desc = "toggle relative numbers" }
)

vim.keymap.set('n', '<leader>S', '<cmd>mksession Session.vim<CR>', { desc = "save session" })
