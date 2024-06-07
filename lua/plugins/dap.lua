return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"leoluz/nvim-dap-go",
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"williamboman/mason.nvim",
			"theHamsta/nvim-dap-virtual-text",
		},
		config = function()
			local dap = require("dap")
			local ui = require("dapui")

			require("dapui").setup()
			require("dap-go").setup()
			require("nvim-dap-virtual-text").setup()

			-- Eval var under cursor
			vim.keymap.set("n", "<space>?", function()
				require("dapui").eval(nil, { enter = true })
			end)

			vim.keymap.set("n", "<F4>", dap.step_back)
			vim.keymap.set("n", "<F5>", dap.continue)
			vim.keymap.set("n", "<C-S-F5>", dap.restart)
			vim.keymap.set("n", "<S-F5>", dap.terminate)
			vim.keymap.set("n", "<F9>", dap.toggle_breakpoint)
			vim.keymap.set("n", "<C-F9>", function()
				require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end)
			vim.keymap.set("n", "<C-F10>", dap.run_to_cursor)
			vim.keymap.set("n", "<C-S-F10>", dap.goto_)
			vim.keymap.set("n", "<F10>", dap.step_over)
			vim.keymap.set("n", "<F11>", dap.step_into)
			vim.keymap.set("n", "<S-F11>", dap.step_out)
			vim.keymap.set("n", "<F12>", dap.repl.toggle)

			dap.listeners.before.attach.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				ui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				ui.close()
			end
		end,
	},
}
