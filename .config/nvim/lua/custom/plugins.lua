local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

        -- Override plugin definition options
        -- {
        --         "vhyrro/luarocks.nvim",
        --         priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
        --         config = true,
        -- },
        --
        -- {
        --         'nanotee/sqls.nvim',
        --         ft = { 'sql', "mysql", "plsql" },
        --         config = function()
        --                 require('lspconfig').sqls.setup{
        --                         on_attach = function(client, bufnr)
        --                                 require('sqls').on_attach(client, bufnr)
        --                         end
        --                 }
        --         end,
        -- },

        {
                'Bekaboo/dropbar.nvim',
                event = "VeryLazy",
                -- optional, but required for fuzzy finder support
                dependencies = { 'nvim-telescope/telescope-fzf-native.nvim' }
        },

        {
                "ellisonleao/glow.nvim",
                cmd = "Glow",
                config = function ()
                        require('glow').setup({
                                style = "dark",
                        })
                end,
        },

        {
                'nanotee/zoxide.vim',
                dependencies = { 'junegunn/fzf.vim' },
                lazy = false,
        },

        {
                'ThePrimeagen/vim-be-good',
                cmd = "VimBeGood",
        },

        {
                "nvimtools/none-ls.nvim",
                event = "VeryLazy",
                opts = function ()
                        return require "custom.configs.null-ls"
                end,
                config = function(_, opts)
                        require("null-ls").setup(opts)
                end,
        },

        -- {
        --         "jose-elias-alvarez/null-ls.nvim",
        --         event = "VeryLazy",
        --         opts = function()
        --                 return require "custom.configs.null-ls"
        --         end,
        -- },

        {
                "folke/todo-comments.nvim",
                event = { "BufReadPre", "BufNewFile" },
                dependencies = { "nvim-lua/plenary.nvim", "folke/trouble.nvim" },
                opts = {},
                init = function()
                        require("core.utils").load_mappings("todo_comments")
                end,
                config = function()
                        require("todo-comments").setup()
                end,
        },


        {
                "CRAG666/code_runner.nvim",
                event = "VeryLazy",
                opts = function ()
                        return require "custom.configs.code_runner"
                end,
                init = function()
                        require("core.utils").load_mappings("code_runner")
                end,
                config = function(_, opts)
                        require("code_runner").setup(opts)
                end
        },


        {
                "folke/trouble.nvim",
                event = "VeryLazy",
                dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
                opts = {
                        focus = true,
                        -- mode = "lsp_document_diagnostics",
                        -- auto_close = true,
                        -- auto_preview = true,
                        -- auto_fold = true,
                        -- signs = {
                        --         error = "",
                        --         warning = "",
                        --         hint = "",
                        --         information = "",
                        -- },
                        -- use_lsp_diagnostic_signs = true,
                },
                config = function()
                        require("trouble").setup()
                end,
                init = function()
                        require("core.utils").load_mappings("trouble")
                end,
        },

        {
                "mhartington/formatter.nvim",
                event = "VeryLazy",
                opts = function()
                        return require "custom.configs.formatter"
                end
        },

        {
                "echasnovski/mini.nvim",
                lazy = false,
                config = function()
                        require("mini.icons").setup()
                end,
        },

        {
                "ThePrimeagen/harpoon",
                lazy = true,
                init = function()
                        require("core.utils").load_mappings("harpoon")
                end
        },

        {
                "tpope/vim-fugitive",
                lazy = false,
        },

        {
                "tpope/vim-dadbod",
                opt = true,
                ft = { 'sql', "mysql", "plsql" },
                dependencies = {
                        "kristijanhusak/vim-dadbod-ui",
                        "kristijanhusak/vim-dadbod-completion",
                },
                cmd = { "DBUIToggle", "DBUI", "DBUIAddConnection", "DBUIFindBuffer", "DBUIRenameBuffer", "DBUILastQueryInfo" },
                config= function()
                        require("custom.configs.dadbod").setup()
                end,
        },

        {
                "nosduco/remote-sshfs.nvim",
                dependencies = { "nvim-telescope/telescope.nvim" },
                opts = {
                        -- Refer to the configuration section below
                        -- or leave empty for defaults
                },
                cmd = {
                        "RemoteSSHFSConnect",
                        "RemoteSSHFSDisconnect",
                        "RemoteSSHFSEdit",
                        "RemoteSSHFSFindFiles",
                        "RemoteSSHFSLiveGrep",
                        "RemoteSSHFSReload"
                },

        },

        {
                "nvim-telescope/telescope.nvim",
                opts = overrides.telescope,
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
                                        enabled = false,
                                },
                        },
                },
                dependencies = {
                        "MunifTanjim/nui.nvim",
                        "rcarriga/nvim-notify",
                        "nvim-treesitter/nvim-treesitter",
                },
                init = function()
                        require("core.utils").load_mappings("noice")
                end,
                config = function(_, opts)
                        require("noice").setup(opts)
                end
        },

        { "hrsh7th/cmp-cmdline" },

        {
                "kdheepak/lazygit.nvim",
                event = "VeryLazy",
                dependencies = {
                        "nvim-telescope/telescope.nvim",
                        "nvim-lua/plenary.nvim",
                },
        },

        -- {
        --         "christoomey/vim-tmux-navigator",
        --         lazy = true,
        -- },
        --
        --
        -- {
        --         "roobert/action-hints.nvim",
        --         config = function()
        --                 require("action-hints").setup()
        --         end
        -- },
        ----AI's---------------------------------------------------------------
        -----------------------------------------------------------------------
        -- {
        --         "github/copilot.vim",
        --         event = "VeryLazy",
        -- },

        {
                "Exafunction/codeium.vim",
                cmd = "Codeium",
                init = function()
                        require("core.utils").load_mappings("codeium")
                end,
        },
        --
        {
                "zbirenbaum/copilot.lua",
                cmd = "Copilot",
                opts = function ()
                        return require "custom.configs.copilot"
                end,
                config = function(_, opts)
                        require("copilot").setup(opts)
                end
        },

        --      {
        --             "zbirenbaum/copilot-cmp",
        --             dependencies = { "copilot.lua" },
        --             config = function()
        --                     require("copilot_cmp").setup()
        --             end,
        --     },
        --
        {
                "CopilotC-Nvim/CopilotChat.nvim",
                branch = "canary",
                dependencies = {
                        "zbirenbaum/copilot.lua", -- or github/copilot.vim
                        "nvim-lua/plenary.nvim", -- for curl, log wrapper
                },
                cmd = "CopilotChat",
                opts = {
                        debug = false,
                        question_header = '## R31NC4RN473 ', -- Header to use for user questions
                        answer_header = '## Copilot ',
                },
        },
        --
        -------------------------------------------------------------------------
        -------------------------------------------------------------------------

        {
                "michaelrommel/nvim-silicon",
                lazy = true,
                cmd = "Silicon",
                init = function()
                        require("core.utils").load_mappings("silicon")
                end,
                config = function()
                        require("silicon").setup({
                                font = "JetBrainsMono Nerd Font=34;Noto Color Emoji=34",
                                theme = "Dracula",
                                background = "#94e2d5",
                        })
                end
        },

        {
                "mfussenegger/nvim-lint",
                event = "VeryLazy",
                config= function()
                        require "custom.configs.lint"
                end
        },

        {
                "neovim/nvim-lspconfig",
                config = function()
                        require "plugins.configs.lspconfig"
                        require "custom.configs.lspconfig"
                end, -- Override to setup mason-lspconfig
        },

        -- override plugin configs
        {
                "williamboman/mason.nvim",
                opts = {
                        ensure_installed = {
                                "prettier",
                                "erb-lint",
                                "ruby-lsp",
                                -- ts js
                                "eslint-lsp",
                                "typescript-language-server",
                                "tailwindcss-language-server",
                                --py
                                "pyright",
                                "black",
                                "mypy",
                                "ruff",
                                "debugpy",
                                -- rust
                                "rust-analyzer",
                                -- cpp
                                "clangd",
                                "clang-format",
                                "codelldb",
                                -- bash
                                "bashls",
                        },
                },
        },

        {
                "nvim-treesitter/nvim-treesitter",
                opts = {
                        ensure_installed = {
                                -- defaults
                                "vim",
                                "lua",

                                -- webdev
                                "html",
                                "css",
                                "javascript",
                                "typescript",
                                "ruby",
                                "tsx",
                                "json",
                                "ruby",
                                "tmux",
                                "markdown",
                                "markdown_inline",
                                "regex",
                                "rust",

                                -- low level
                                "c",
                                "python",
                                "cpp",
                                "bash"
                        },
                },
        },

        {
                "nvim-tree/nvim-tree.lua",
                opts = overrides.nvimtree,
        },

        -- Install a plugin
        {
                "max397574/better-escape.nvim",
                event = "InsertEnter",
                config = function()
                        require("better_escape").setup()
                end,
        },

        {
                "stevearc/conform.nvim",
                --  for users those who want auto-save conform + lazyloading!
                -- event = "BufWritePre"
                config = function()
                        require "custom.configs.conform"
                end,
        },

        {
                "windwp/nvim-ts-autotag",
                ft = {
                        "javascript",
                        "javascriptreact",
                        "typescript",
                        "typescriptreact",
                        "html",
                },
                config = function ()
                        require("nvim-ts-autotag").setup()
                end
        },

        {
                "nvim-neotest/nvim-nio",
        },

        {
                "jay-babu/mason-nvim-dap.nvim",
                dependencies = {
                        "williamboman/mason.nvim",
                        "mfussenegger/nvim-dap",
                },
                opts = {
                        handlers = {},
                },
        },

        {
                "mfussenegger/nvim-dap",
                init = function()
                        require("core.utils").load_mappings("dap")
                end
        },

        {
                "mfussenegger/nvim-dap-python",
                ft = "python",
                dependencies = {
                        "mfussenegger/nvim-dap",
                        "rcarriga/nvim-dap-ui",
                        "nvim-neotest/nvim-nio"
                },
                config = function(_, opts)
                        local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
                        require("dap-python").setup(path)
                        require("core.utils").load_mappings("dap_python")
                end,
        },

        {
                "leoluz/nvim-dap-go",
                ft = "go",
                dependencies = "mfussenegger/nvim-dap",
                config = function(_, opts)
                        require("dap-go").setup(opts)
                        require("core.utils").load_mappings("dap_go")
                end
        },

        {
                "theHamsta/nvim-dap-virtual-text",
                lazy = false,
                config = function(_, opts)
                        require("nvim-dap-virtual-text").setup()
                end
        },

        {
                "rcarriga/nvim-dap-ui",
                event = "VeryLazy",
                dependencies = "mfussenegger/nvim-dap",
                config = function()
                        local dap = require("dap")
                        local dapui = require("dapui")
                        dapui.setup()
                        dap.listeners.after.event_initialized["dapui_config"] = function ()
                                dapui.open()
                        end
                        dap.listeners.before.event_terminated["dapui_config"] = function ()
                                dapui.close()
                        end
                        dap.listeners.before.event_exited["dapui_config"] = function ()
                                dapui.close()
                        end
                end
        },

        {
                'nvim-lualine/lualine.nvim',
                dependencies = { 'nvim-tree/nvim-web-devicons' },
                event = "VeryLazy",
                opts = {
                        options = {
                                icons_enabled = true,
                                theme = 'nightfly',
                                component_separators = '|',
                                section_separators = { left = '', right = '' },
                        },
                        sections = {
                                lualine_a = { 'mode' },
                                lualine_b = { 'branch', 'diff',
                                        {
                                                'diagnostics',
                                                sources = { "nvim_diagnostic" },
                                                symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' }
                                        }
                                },
                                lualine_c = { 'filename' },
                                lualine_x = { 'copilot' ,'encoding', 'fileformat', 'filetype' }, -- I added copilot here
                                lualine_y = { 'progress' },
                                lualine_z = { 'location' }
                        },
                        inactive_sections = {
                                lualine_a = {},
                                lualine_b = {},
                                lualine_c = { 'filename' },
                                lualine_x = { 'location' },
                                lualine_y = {},
                                lualine_z = {}
                        },
                        tabline = {},
                        extensions = {}

                },
        },

        { 'AndreM222/copilot-lualine' },

        {
                "rust-lang/rust.vim",
                ft = "rust",
                init = function ()
                        vim.g.rustfmt_autosave = 1
                end
        },

        {
                "simrat39/rust-tools.nvim",
                ft = "rust",
                dependencies = "neovim/nvim-lspconfig",
                opts = function ()
                        return require "custom.configs.rust-tools"
                end,
                config = function (_, opts)
                        require('rust-tools').setup(opts)
                end
        },

        {
                "saecki/crates.nvim",
                ft = { "rust", "toml" },
                config = function (_, opts)
                        local crates = require('crates')
                        crates.setup(opts)
                        crates.show()
                end,
        },

        {
                "hrsh7th/nvim-cmp",
                opts = function ()
                        local M = require "plugins.configs.cmp"
                        table.insert(M.sources, {name = "crates"})
                        return M
                end,
        },

        -- {
        --         "goolord/alpha-nvim",
        --         event = "VimEnter",
        --         config = function()
        --                 local alpha = require("alpha")
        --                 local dashboard = require("alpha.themes.dashboard")
        --
        --                 -- Set header
        --                 dashboard.section.header.val = {
        --                         "                                                     ",
        --                         "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
        --                         "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
        --                         "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
        --                         "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
        --                         "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
        --                         "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
        --                         "                                                     ",
        --                 }
        --
        --                 -- Set menu
        --                 dashboard.section.buttons.val = {
        --                         dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
        --                         dashboard.button("SPC e", "  > Open File Explorer", "<cmd>NvimTreeToggle<CR>"),
        --                         dashboard.button("SPC ff", "󰱼  > Find File", "<cmd>Telescope find_files<CR>"),
        --                         dashboard.button("SPC fo", "󰁯  > Find Old File", "<cmd>Telescope oldfiles<CR>"),
        --                         dashboard.button("SPC fa", "  > Find All", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>"),
        --                         dashboard.button("SPC fh", "  > Help Page", "<cmd>Telescope help_tags<CR>"),
        --                         dashboard.button("SPC ch", "⚡ > Nvim Cheatsheet", "<cmd>NvCheatsheet<CR>"),
        --                         dashboard.button("q", "  > Quit Nvim", "<cmd>qa<CR>"),
        --                 }
        --
        --                 -- Send config to alpha
        --                 alpha.setup(dashboard.opts)
        --
        --                 -- Disable folding on alpha buffer
        --                 vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
        --         end,
        -- },




        -- To make a plugin not be loaded
        -- {
        --   "NvChad/nvim-colorizer.lua",
        --   enabled = false
        -- },

        -- All NvChad plugins are lazy-loaded by default
        -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
        -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
        -- {
        --   "mg979/vim-visual-multi",
        --   lazy = false,
        -- }
}

return plugins
