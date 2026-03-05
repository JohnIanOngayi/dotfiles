return {
	{
		"nvim-telescope/telescope.nvim",
		-- branch = "master", -- using master to fix issues with deprecated to definition warnings 
		-- '0.1.x' for stable ver.
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-tree/nvim-web-devicons",
			"andrew-george/telescope-themes",
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local builtin = require("telescope.builtin")

			telescope.load_extension("fzf")
			telescope.load_extension("themes")
			telescope.load_extension("file_browser")

			telescope.setup({
				defaults = {
					path_display = { "smart" },
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous,
							["<C-j>"] = actions.move_selection_next,
						},
					},
				},
				extensions = {
					themes = {
						enable_previewer = true,
						enable_live_preview = true,
						persist = {
							enabled = true,
							path = vim.fn.stdpath("config") .. "/lua/colorscheme.lua",
						},
					},
				},
			})

			-- Keymaps
			vim.keymap.set("n", "<leader>pWs", function()
				local word = vim.fn.expand("<cWORD>")
				builtin.grep_string({ search = word })
			end, { desc = "Find Connected Words under cursor" })

			vim.keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "Telescope find oldfiles" })
			vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Telescope find file" })
			vim.keymap.set("n", "<leader>fw", "<cmd>Telescope find_word<CR>", { desc = "Telescope find word" })
			vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Telescope help page" })
			vim.keymap.set("n", "<leader>th", "<cmd>Telescope themes<CR>", { noremap = true, silent = true, desc = "Telescope find themes" })
			vim.keymap.set("n", "<space>fb", "<cmd>Telescope file_browser<CR>", { desc = "Telescope browse files" })		
			-- vim.keymap.set("n", "<space>fb","<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>", { desc = "Telescope browse files" })		
		end,
	},
	--lazy
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
	},

}
