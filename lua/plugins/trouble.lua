return {
	"folke/trouble.nvim",
	config = function()
		require("trouble").setup()
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

		vim.keymap.set("n", "[t", function()
			if require("trouble").is_open() then
				require("trouble").prev({ skip_groups = true, jump = true })
			else
				local ok, err = pcall(vim.cmd.cprev)
				if not ok then
					vim.notify(err, vim.log.levels.ERROR)
				end
			end
		end, { desc = "Previous Trouble/Quickfix Item" })

		vim.keymap.set("n", "]t", function()
			if require("trouble").is_open() then
				require("trouble").next({ skip_groups = true, jump = true })
			else
				local ok, err = pcall(vim.cmd.cnext)
				if not ok then
					vim.notify(err, vim.log.levels.ERROR)
				end
			end
		end, { desc = "Next Trouble/Quickfix Item" })
	end,
}
