return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		config = function()
			-- import nvim-treesitter plugin
			local treesitter = require("nvim-treesitter")

			-- configure treesitter
			treesitter.setup({ -- enable syntax highlighting
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				-- enable indentation
				indent = { enable = true },

				-- ensure these languages parsers are installed
				ensure_installed = {
					"vim",
					"vimdoc",
					"lua",

					"json",
					"yaml",
					"markdown",
					"markdown_inline",

					"javascript",
					"typescript",
					"jsx",
					"tsx",
					"svelte",
					"php",
					"html",
					"css",

					"c",
					"cpp",
					"python",
					"java",
					"rust",

					"bash",
					"http",
					"gitignore",
					"dockerfile",
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						-- scope_incremental = false,
						node_decremental = "<C-backspace>",
					},
				},
			})
			-- force start treesitter for all filetypes
			vim.api.nvim_create_autocmd('FileType', {
				pattern = '*',
				callback = function()
					pcall(vim.treesitter.start)
				end,
			})
		end,
	},
	-- NOTE: js,ts,jsx,tsx Auto Close Tags
	{
		"windwp/nvim-ts-autotag",
		enabled = true,
		ft = { "html", "xml", "javascript", "typescript", "javascriptreact", "typescriptreact", "svelte" },
		config = function()
			-- Independent nvim-ts-autotag setup
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true,           -- Auto-close tags
					enable_rename = true,          -- Auto-rename pairs
					enable_close_on_slash = false, -- Disable auto-close on trailing `</`
				},
				per_filetype = {
					["html"] = {
						enable_close = true, -- Disable auto-closing for HTML
					},
					["typescriptreact"] = {
						enable_close = true, -- Explicitly enable auto-closing (optional, defaults to `true`)
					},
				},
			})
		end,
	},
}
