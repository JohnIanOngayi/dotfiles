local M = {
        filetype = {
                javascript = {
                        require("formatter.filetypes.javascript").prettier
                },
                javascriptreact = {
                        require("formatter.filetypes.javascriptreact").prettier
                },
                typescript = {
                        require("formatter.filetypes.typescript").prettier
                },
                python = {
                        require("formatter.filetypes.python").black
                },
                ["*"] = {
                        require("formatter.filetypes.any").remove_trailing_whitespace
                }
        }
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        command = "FormatWriteLock"
})

return M
