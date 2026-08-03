-- return {
-- 	"rcarriga/nvim-dap-ui",
-- 	dependencies = {
-- 		{
-- 			"mfussenegger/nvim-dap",
-- 			config = function()
-- 				local dap = require("dap")
--
-- 				dap.adapters.gdb = {
-- 					type = "executable",
-- 					command = "gdb",
-- 					args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
-- 				}
--
-- 				dap.configurations.c = {
-- 					{
-- 						name = "Launch",
-- 						type = "gdb",
-- 						request = "launch",
-- 						program = function()
-- 							return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
-- 						end,
-- 						args = function()
-- 							local args = {}
-- 							local arguments = vim.fn.input('Arguments: ./exe', '', 'file')
-- 							for i in string.gmatch(arguments, "%S+") do
-- 								table.insert(args, i)
-- 							end
-- 							return args
-- 						end, -- provide arguments if needed
-- 						cwd = "${workspaceFolder}",
-- 						stopAtBeginningOfMainSubprogram = false,
-- 					},
-- 					{
-- 						name = "Select and attach to process",
-- 						type = "gdb",
-- 						request = "attach",
-- 						program = function()
-- 							return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
-- 						end,
-- 						pid = function()
-- 							local name = vim.fn.input('Executable name (filter): ')
-- 							return require("dap.utils").pick_process({ filter = name })
-- 						end,
-- 						cwd = '${workspaceFolder}'
-- 					},
-- 					{
-- 						name = 'Attach to gdbserver :1234',
-- 						type = 'gdb',
-- 						request = 'attach',
-- 						target = 'localhost:1234',
-- 						program = function()
-- 							return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
-- 						end,
-- 						cwd = '${workspaceFolder}'
-- 					}
-- 				}
-- 			end
-- 		}
-- 		, "nvim-neotest/nvim-nio" },
-- 	config = function()
-- 		require('dapui').setup()
-- 	end
-- }
return {
	"mfussenegger/nvim-dap",
	config = function()
		local dap = require("dap")

		dap.adapters.gdb = {
			type = "executable",
			command = "gdb",
			args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
		}

		dap.configurations.c = {
			{
				name = "Launch",
				type = "gdb",
				request = "launch",
				program = function()
					return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				end,
				args = function()
					local args = {}
					local arguments = vim.fn.input('Arguments: ./exe ', '', 'file')
					for i in string.gmatch(arguments, "%S+") do
						table.insert(args, i)
					end
					return args
				end, -- provide arguments if needed
				cwd = "${workspaceFolder}",
				stopAtBeginningOfMainSubprogram = false,
			},
			{
				name = "Select and attach to process",
				type = "gdb",
				request = "attach",
				program = function()
					return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				end,
				pid = function()
					local name = vim.fn.input('Executable name (filter): ')
					return require("dap.utils").pick_process({ filter = name })
				end,
				cwd = '${workspaceFolder}'
			},
			{
				name = 'Attach to gdbserver :1234',
				type = 'gdb',
				request = 'attach',
				target = 'localhost:1234',
				program = function()
					return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				end,
				cwd = '${workspaceFolder}'
			}
		}
	end
}
