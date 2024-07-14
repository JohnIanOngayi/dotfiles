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
                ft = 'sql',
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
                dependencies = {
                        "nvim-telescope/telescope.nvim",
                        "nvim-lua/plenary.nvim",
                },
                cmd = "LazyGit",
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

        -- {
        --         "Exafunction/codeium.vim",
        --         event = "VeryLazy",
        --         init = function()
        --                 require("core.utils").load_mappings("codeium")
        --         end,
        -- },
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
        --
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

        -- {
        --         "michaelrommel/nvim-silicon",
        --         lazy = true,
        --         cmd = "Silicon",
        --         init = function()
        --                 local wk = require("which-key")
        --                 wk.register(
        --                         {
        --                                 { "<leader>sc", ":Silicon<CR>", desc = "Snapshot Code", mode = "v" },
        --                         }
        --                 )
        --         end,
        --         config = function()
        --                 require("silicon").setup({
        --                         font = "JetBrainsMono Nerd Font=34;Noto Color Emoji=34",
        --                         theme = "Dracula",
        --                         background = "#94e2d5",
        --                 })
        --         end
        -- },

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
                                "eslint-lsp",
                                "ruby-lsp",
                                "typescript-language-server",
                                "tailwindcss-language-server",
                                "pyright",
                                "debugpy",
                                "rust-analyzer",
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
