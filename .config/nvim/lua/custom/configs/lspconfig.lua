local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "clangd", "eslint", "csharp_ls", "omnisharp", "intelephense" } --, "puppet-editor-services" }

for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup({
                on_attach = on_attach,
                capabilities = capabilities,
        })
end

lspconfig.clangd.setup({
        on_attach = function(client, bufnr)
                client.server_capabilities.signatureHelpProvider = false
                on_attach(client, bufnr)
        end,
        capabilities = capabilities,
})

lspconfig.omnisharp.setup({
        cmd = { "omnisharp" },
        -- cmd = { "~/.local/bin/omnisharp/run", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
        filetypes = { "cs", "cshtml" },
        root_dir = require("lspconfig").util.root_pattern("*.sln", "*.csproj", ".git"),
        capabilities = capabilities,
})

--
lspconfig.ts_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        init_options = {
                preferences = {
                        disableSuggestions = true,
                },
        },
})

lspconfig.pyright.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "python" },
})

lspconfig.dockerls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
})

lspconfig.docker_compose_language_service.setup({
        on_attach = on_attach,
        capabilities = capabilities,
})

lspconfig.emmet_ls.setup({
        -- on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {
                "css",
                "eruby",
                "html",
                "javascript",
                "javascriptreact",
                "less",
                "sass",
                "scss",
                "svelte",
                "pug",
                "typescript",
                "typescriptreact",
                "vue",
                "express",
                "ejs",
                "cshtml",
                "blade",
                "php",
        },
        init_options = {
                html = {
                        options = {
                                -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
                                ["bem.enabled"] = true,
                        },
                },
        },
})

lspconfig.tailwindcss.setup({
        on_attach = on_attach,
        capabilities = capabilities,
})

lspconfig.ruby_lsp.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "ruby" },
})

lspconfig.phpactor.setup({
        root_dir = function(_)
                return vim.loop.cwd()
        end,
        init_options = {
                ["language_server.diagnostics_on_update"] = false,
                ["language_server.diagnostics_on_open"] = false,
                ["language_server.diagnostics_on_save"] = false,
                ["language_server_phpstan.enabled"] = false,
                ["language_server_psalm.enabled"] = false,
        },
})
