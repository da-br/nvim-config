return {
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		config = function()
			require("trouble").setup({})
			vim.keymap.set(
				"n",
				"<leader>tt",
				":Trouble diagnostics toggle focus=true<cr>",
				{ desc = "Diagnostics (Trouble)" }
			)

			vim.keymap.set(
				"n",
				"<leader>tb",
				":Trouble diagnostics toggle filter.buf=0<cr>",
				{ desc = "Buffer Diagnostics (Trouble)" }
			)

			vim.keymap.set(
				"n",
				"<leader>tl",
				":Trouble lsp toggle focus=false win.position=right<cr>",
				{ desc = "LSP Definitions / references / ... (Trouble)" }
			)

			vim.keymap.set("n", "<leader>tL", ":Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })

			vim.keymap.set("n", "<leader>tq", ":Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })
		end,
	},
}
