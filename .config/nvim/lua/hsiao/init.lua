vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
require("hsiao.lazy") --Load Lazy
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex, { desc = "open backup file tree" })
vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })
vim.keymap.set("n", "<tab>", "<cmd>bnext<CR>", { desc = "change tab" })
vim.keymap.set("n", "<leader>x", "<cmd>bd<CR> <bar> <cmd>bl<CR>", { desc = "close current tab" })
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope.find_files, { desc = 'telescope find files' })
vim.keymap.set('n', '<leader>fg', telescope.live_grep, { desc = 'telescope live grep' })
vim.keymap.set('n', '<leader>fb', telescope.buffers, { desc = 'telescope buffers' })
vim.keymap.set('n', '<leader>fh', telescope.help_tags, { desc = 'telescope help tags' })
vim.keymap.set('v', '<leader>y', '"+y', { desc = "copy to system clip" })
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p', { desc = "paste from system clip" })

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

--LSP Configuration
require("vim.lsp")
vim.lsp.codelens.enable(not vim.lsp.codelens.is_enabled())

vim.api.nvim_create_autocmd('LspAttach', {

	group = vim.api.nvim_create_augroup('my.lsp', {}),

	callback = function(ev)
		local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

		if client:supports_method('textDocument/implementation') then
			-- Create a keymap for vim.lsp.buf.implementation ...
		end

		-- Auto-format ("lint") on save.

		-- Usually not needed if server supports "textDocument/willSaveWaitUntil".

		if not client:supports_method('textDocument/willSaveWaitUntil')

			 and client:supports_method('textDocument/formatting') then
			vim.api.nvim_create_autocmd('BufWritePre', {

				group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),

				buffer = ev.buf,

				callback = function()
					vim.lsp.buf.format({ bufnr = ev.buf, id = client.id, timeout_ms = 1000 })
				end,

			})
		end
	end,

})

vim.lsp.enable({
	'lua_ls',
	'ccls',
	'basedpyright',
	'jdtls',
	'gopls',
	'rust_analyzer',
	-- "csharpls"
})

vim.diagnostic.config({
	virtual_text = true
})

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
-- Eventual migration when I get color support figured out
-- vim.opt.autocomplete = true
