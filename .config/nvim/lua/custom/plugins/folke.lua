return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		keys = {
			{ "<leader>gl", function() require("snacks").lazygit() end, desc = "Lazygit" },
			-- { "<leader>glg", function() require("snacks").lazygit.log() end, desc = "Lazygit Logs" },
			{ "<leader>rN", function() require("snacks").rename.rename_file() end, desc = "Fast Rename Current File" },
			{ "<leader>dB", function() require("snacks").bufdelete() end, desc = "Delete or Close Buffer  (Confirm)" },
		}
	},
	{
		"folke/todo-comments.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "nvim-lua/plenary.nvim", "folke/trouble.nvim" },
		opts = {},
		init = function()
			vim.keymap.set("n", "]t", function()
				require("todo-comments").jump_next()
			end, { desc = "Next todo comment" })

			vim.keymap.set("n", "[t", function()
				require("todo-comments").jump_prev()
			end, { desc = "Previous todo comment" })
		end,
		config = function()
			require("todo-comments").setup()
		end,
	}
}
