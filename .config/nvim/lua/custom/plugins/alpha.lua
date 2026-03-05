return  {
           "goolord/alpha-nvim",
           event = "VimEnter",
           config = function()
                   local alpha = require("alpha")
                   local dashboard = require("alpha.themes.dashboard")
  
                   -- Set header
                   dashboard.section.header.val = {
                           "                                                     ",
                           "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
                           "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
                           "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
                           "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
                           "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
                           "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
                           "                                                     ",
                   }
  
                   -- Set menu
                   dashboard.section.buttons.val = {
                           dashboard.button("  e", "  > New File", "<cmd>ene<CR>"),
			   dashboard.button(" fo", "󰁯  > Find Recents", "<cmd>Telescope oldfiles<CR>"),
			   dashboard.button(" wr", "⚡ > Restore Session", "<cmd>AutoSession restore<CR>"),
                           dashboard.button(" fb", "  > Browse Files", "<cmd>Telescope file_browser<CR>"),
                           dashboard.button(" ff", "󰱼  > Find File", "<cmd>Telescope find_files<CR>"),
                           dashboard.button(" fh", "  > Help Page", "<cmd>Telescope help_tags<CR>"),
                           dashboard.button("  q", "  > Quit Nvim", "<cmd>qa<CR>"),
                   }
  
                   -- Send config to alpha
                   alpha.setup(dashboard.opts)
  
                   -- Disable folding on alpha buffer
                   vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
           end,
   }

