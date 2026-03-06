return {
	"williamboman/mason.nvim",
	lazy = false,
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"neovim/nvim-lspconfig",
		{ "folke/neodev.nvim", opts = {} },
		-- "saghen/blink.cmp",
	},
	config = function()
		require("neodev").setup()
		-- import mason and mason_lspconfig
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		-- NOTE: Moved these local imports below back to lspconfig.lua due to mason depracated handlers

		-- local lspconfig = require("lspconfig")
		-- local cmp_nvim_lsp = require("cmp_nvim_lsp")             -- import cmp-nvim-lsp plugin
		-- local capabilities = cmp_nvim_lsp.default_capabilities() -- used to enable autocompletion (assign to every lsp server config)

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			automatic_enable = false,

			registries = {
				"github:mason-org/mason-registry",
				"github:crashdummyy/mason-registry",
			},
			-- servers for mason to install
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"angularls",
				"astro",
				"marksman",
				"pyright",
				"emmet_ls",
				"emmet_language_server",
				-- C# (requires dotnet SDK installed on system)
				-- "csharp_ls",      -- needs: sudo apt install dotnet-sdk-8.0
				"omnisharp",
				"clangd",
				"dockerls",
				"docker_compose_language_service",
				"intelephense",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier",
				"stylua",
				"eslint_d",
				"isort", -- needs: sudo apt install python3-pip
				"pylint", -- needs: sudo apt install python3-pip
				"ruff", -- needs: sudo apt install python3-pip
				"debugpy",
				"netcoredbg", -- needs: sudo apt install dotnet-sdk-8.0
				"csharpier", -- needs: sudo apt install dotnet-sdk-8.0
				"php-cs-fixer",
				"black",
			},
			-- NOTE: mason BREAKING Change! Removed setup_handlers
			-- moved lsp configuration settings back into lspconfig.lua file
		})
	end,
}
