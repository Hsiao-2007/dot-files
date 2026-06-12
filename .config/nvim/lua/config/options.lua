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
--

--LSP Configuration
require("vim.lsp")
-- vim.lsp.codelens.enable(not vim.lsp.codelens.is_enabled())
vim.lsp.codelens.enable(true)

vim.lsp.enable({
	'lua_ls',
	'ccls',
	'basedpyright',
	'jdtls',
	'gopls',
	'rust_analyzer',
	"csharp_ls"
})

vim.diagnostic.config({
	virtual_text = false
})

require('blink.cmp').build():pwait()
