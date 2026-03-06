return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", "AndreM222/copilot-lualine" },
		event = "VeryLazy",
		opts = {
			options = {
				icons_enabled = true,
				theme = "nightfly",
				component_separators = "|",
				-- section_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					"branch",
					"diff",
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						symbols = { error = " ", warn = " ", info = " ", hint = " " },
					},
				},
				lualine_c = { "filename" },
				lualine_x = { "copilot", "encoding", "fileformat", "filetype" }, -- I added copilot here
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			extensions = {},
		}
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		options = {
			separator_style = "|"
		},
		init = function()
			-- Cycle through buffers
			vim.keymap.set("n", "<tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next Buffer" })
			vim.keymap.set("n", "<S-tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Prev Buffer" })

			-- Close buffer
			vim.keymap.set("n", "<leader>x", "<cmd>bdelete<CR>", { desc = "Close current buffer" })
		end,
		config = function()
			local bufferline = require("bufferline")
			bufferline.setup({
				options = {
					mode = "buffers",
					separator_style = "slant", -- Use 'thick' or 'thin' for a cleaner look
					diagnostics = "nvim_lsp",
					offsets = {
						{
							filetype = "NvimTree",
							text = "File Explorer",
							text_align = "center",
							separator = true,
						},
					},
				},
			})
		end
	},
	{
		"Bekaboo/dropbar.nvim",
		event = "VeryLazy",
		-- optional, but required for fuzzy finder support
		dependencies = { "nvim-telescope/telescope-fzf-native.nvim" },
	},
}
