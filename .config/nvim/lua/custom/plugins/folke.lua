return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		keys = {
			{
				"<leader>gl",
				function()
					require("snacks").lazygit()
				end,
				desc = "Lazygit",
			},
			-- { "<leader>glg", function() require("snacks").lazygit.log() end, desc = "Lazygit Logs" },
			{
				"<leader>rN",
				function()
					require("snacks").rename.rename_file()
				end,
				desc = "Fast Rename Current File",
			},
			{
				"<leader>dB",
				function()
					require("snacks").bufdelete()
				end,
				desc = "Delete or Close Buffer  (Confirm)",
			},
		},
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
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				hover = {
					enabled = false,
				},
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
				signature = {
					{ enabled = false },
				},
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
			"nvim-treesitter/nvim-treesitter",
		},
		init = function()
			vim.keymap.set("n", "<leader>nd", "<cmd>Noice dismiss<CR>", { desc = "Dismiss noice message" })
		end,
		config = function(_, opts)
			require("noice").setup(opts)
		end,
	},
	-- {
	-- 	"folke/trouble.nvim",
	-- 	dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
	-- 	opts = {
	-- 		focus = true,
	-- 	},
	-- 	cmd = "Trouble",
	-- 	keys = {
	-- 		{ "<leader>xw", "<cmd>Trouble diagnostics toggle<CR>", desc = "Open trouble workspace diagnostics" },
	-- 		{
	-- 			"<leader>xd",
	-- 			"<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
	-- 			desc = "Open trouble document diagnostics",
	-- 		},
	-- 		{ "<leader>xq", "<cmd>Trouble quickfix toggle<CR>", desc = "Open trouble quickfix list" },
	-- 		{ "<leader>xl", "<cmd>Trouble loclist toggle<CR>", desc = "Open trouble location list" },
	-- 		{ "<leader>xt", "<cmd>Trouble todo toggle<CR>", desc = "Open todos in trouble" },
	-- 	},
	-- },
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{
				"<leader>wk",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
}
