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
                ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "Add debugger breakpoint" },
                ["<leader>dus"] = {
                        function ()
                                local widgets = require('dap.ui.widgets');
                                local sidebar = widgets.sidebar(widgets.scopes);
                                sidebar.open();
                        end,
                        "Open debugging sidebar"
                },
                ["<leader>dr"] = { "<cmd> DapContinue <CR>", "Start or continue debugger" },
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
                ["<leader>ft"] = { "<cmd> TodoTelescope <CR>", "find todos" },
        }
}

M.trouble = {
        plugin = true,
        n = {
                ["<leader>tr"] = {"<cmd> Trouble diagnostics toggle<cr>", "diagnostics"},
        }
}

M.todo_comments = {
        plugin = true,
        n = {
                ["]t"] = { function ()
                        require("todo-comments").jump_next()
                end,
                        "next to-do comment"
                },
                ["[t"] = { function ()
                        require("todo-comments").jump_prev()
                end,
                        "previous to-do comment"
                },
        }
}
M.noice = {
        plugin = true,
        n = {
                ["<leader>nd"] = { "<cmd> Noice dismiss <CR>", "dismiss noice message" }
        }
}

M.silicon = {
        plugin = true,
        v = {
                ["<leader>sc"] = { "<cmd> Silicon <CR>", "silicon snapshot" }
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
                ["<leader>mx"] = { "<cmd> lua require('harpoon.mark').add_file()<CR>", "add file to harpoon" },
                ["<leader>mm"] = { "<cmd> lua require('harpoon.ui').toggle_quick_menu()<CR>", "toggle harpoon menu" },
                ["<leader>mo"] = { "<cmd> lua require('harpoon.ui').nav_file(1)<CR>", "open harpoon menu" },
                ["<leader>mc"] = { "<cmd> lua require('harpoon.ui').nav_file(2)<CR>", "close harpoon menu" },
                -- ["<leader>mt"] = { "<cmd> lua require('harpoon.term').gotoTerminal(1)<CR>", "open terminal" },
                -- ["<leader>mT"] = { "<cmd> lua require('harpoon.term').gotoTerminal(2)<CR>", "close terminal" },
        }
}

M.crates = {
        n = {
                ["<leader>rcu"] = {
                        function()
                                require('crates').upgrade_all_crates()
                        end,
                        "update crates"
                },
        }
}
-- more keybinds!
return M
