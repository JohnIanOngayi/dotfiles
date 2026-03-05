return {
	{
		"tpope/vim-fugitive",
		lazy = false,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local gitsigns = require("gitsigns")
			gitsigns.setup({
				signs = {
					add = { text = "│" },
					change = { text = "│" },
					delete = { text = "󰍵" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
					untracked = { text = "│" },
				},
				on_attach = function(bufnr)
					local gs = package.loaded.gitsigns

					local function map(mode, l, r, desc, opts)
						opts = opts or {}
						opts.buffer = bufnr
						opts.desc = desc
						vim.keymap.set(mode, l, r, opts)
					end

					-- Navigation
					map("n", "]c",
					function()
						if vim.wo.diff then return "]c"
						end
						vim.schedule(function() gs.next_hunk()
						end)
						return "<Ignore>"
					end,
					"Jump to next hunk", { expr = true })

					map("n", "[c",
					function()
						if vim.wo.diff then return "[c"
						end
						vim.schedule(function() gs.prev_hunk()
						end)
						return "<Ignore>"
					end,
					"Jump to prev hunk", { expr = true })

					-- Actions
					map("n", "<leader>rh", gs.reset_hunk, "Reset hunk")
					map("n", "<leader>ph", gs.preview_hunk, "Preview hunk")
					map("n", "<leader>gb", gs.blame_line, "Blame line")
					map("n", "<leader>td", gs.toggle_deleted, "Toggle deleted")
				end,
			})
		end,
	},
}

