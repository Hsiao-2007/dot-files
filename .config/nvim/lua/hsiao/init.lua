require("hsiao.lazy") --Load Lazy
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex, { desc = "open backup file tree" })
vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })
vim.keymap.set("n", "<tab>", "<cmd>bnext<CR>", { desc = "change tab" })
vim.keymap.set("n", "<leader>x", "<cmd>bd<CR> <bar> <cmd>bl<CR>", { desc = "close current tab" })
vim.keymap.set("n", "<leader>s", "<cmd>so<CR>", { desc = "source line" })
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope.find_files, { desc = 'telescope find files' })
vim.keymap.set('n', '<leader>fg', telescope.live_grep, { desc = 'telescope live grep' })
vim.keymap.set('n', '<leader>fb', telescope.buffers, { desc = 'telescope buffers' })
vim.keymap.set('n', '<leader>fh', telescope.help_tags, { desc = 'telescope help tags' })
vim.keymap.set('v', '<leader>y', '"+y', { desc = "copy to system clip" })
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p', { desc = "paste from system clip" })

vim.keymap.set('n', '<leader>tt',
	function()
		local current = require("onedarkpro.config").config.options.transparency
		require("onedarkpro").setup({
			options = {
				transparency = not current
			}
		})
		vim.cmd("colorscheme onedark")
	end,
	{ desc = "toggle transparency" })

vim.keymap.set('n', '<leader>l', function()
		require("lazy").show()
	end,
	{ desc = "open lazy" })

--Options
vim.opt.shiftwidth = 3
vim.opt.number = true
vim.opt.autoindent = true
vim.opt.tabstop = 3
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.termguicolors = true
vim.opt.updatetime = 50
vim.opt.spell = true
vim.opt.spelllang = { "en_us" }
vim.opt.mousemoveevent = true
