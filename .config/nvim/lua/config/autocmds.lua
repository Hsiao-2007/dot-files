vim.api.nvim_create_autocmd('LspAttach', {

	group = vim.api.nvim_create_augroup('my.lsp', {}),

	callback = function(ev)
		local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

		-- if client:supports_method('textDocument/implementation') then
		-- 	-- Create a keymap for vim.lsp.buf.implementation ...
		-- end

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

local ts_group = vim.api.nvim_create_augroup("TelescopeOnEnter", { clear = true })
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		local first_arg = vim.v.argv[3]
		if first_arg and vim.fn.isdirectory(first_arg) == 1 then
			vim.defer_fn(function()
				local telescope = require('telescope')
				vim.cmd("bd")
				telescope.extensions.file_browser.file_browser({ path = first_arg })
			end, 100)
		end
	end,
	group = ts_group
})
