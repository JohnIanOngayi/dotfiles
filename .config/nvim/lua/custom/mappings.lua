---@type MappingsTable
local M = {}

M.general = {
        n = {
                ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" },
                ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
                ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
                ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
                [";"] = { ":", "enter command mode", opts = { nowait = true } },

                --  format with conform
                ["<leader>fm"] = {
                        function()
                                require("conform").format()
                        end,
                        "formatting",
                }

        },
        v = {
                [">"] = { ">gv", "indent"},
        },
}

M.dap = {
        plugin = true,
        n = {
                ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>" },
                ["<leader>dus"] = {
                        function ()
                                local widgets = require('dap.ui.widgets');
                                local sidebar = widgets.sidebar(widgets.scopes);
                                sidebar.open();
                        end,
                        "Open debugging sidebar"
                }
        }
}

M.dap_python = {
        plugin = true,
        n = {
                ["<leader>dpr"] = {
                        function()
                                require('dap-python').test_method()
                        end
                }
        }
}

M.dap_go = {
        plugin = true,
        n = {
                ["<leader>dgr"] = {
                        function()
                                require('dap-go').debug_test()
                        end,
                        "Debug go test"
                },
                ["<leader>dgl"] = {
                        function()
                                require('dap-go').debug_last()
                        end,
                      "Debug last go test"
                }
        }
}

M.telescope = {
        plugin = true,
        n = {
                ["<leader>ma"] = { "<cmd> Telescope harpoon marks <CR>", "harpoon bookmarks" },
        }
}

M.noice = {
        plugin = true,
        n = {
                ["<leader>nd"] = { "<cmd> Noice dismiss <CR>", "dismiss noice message" }
        }
}

M.codeium = {
        plugin = true,
        i = {
                ["<C-e>"] = { "<cmd> CodeiumComplete<CR>", "codeium complete" }   }
}

M.harpoon = {
        plugin = true,
        n = {
                ["<leader>hx"] = { "<cmd> lua require('harpoon.mark').add_file()<CR>", "add file to harpoon" },
                ["<leader>hm"] = { "<cmd> lua require('harpoon.ui').toggle_quick_menu()<CR>", "toggle harpoon menu" },
                ["<leader>ho"] = { "<cmd> lua require('harpoon.ui').nav_file(1)<CR>", "open harpoon menu" },
                ["<leader>hc"] = { "<cmd> lua require('harpoon.ui').nav_file(2)<CR>", "close harpoon menu" },
                ["<leader>ht"] = { "<cmd> lua require('harpoon.term').gotoTerminal(1)<CR>", "open terminal" },
                ["<leader>hT"] = { "<cmd> lua require('harpoon.term').gotoTerminal(2)<CR>", "close terminal" },
        }
}
-- more keybinds!
return M
