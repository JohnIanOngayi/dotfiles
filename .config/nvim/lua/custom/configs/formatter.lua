local M = {
        filetype = {
                html = {
                        require("formatter.filetypes.html").prettier
                },
                css = {
                        require("formatter.filetypes.css").prettier
                },
                javascript = {
                        require("formatter.filetypes.javascript").prettier
                },
                javascriptreact = {
                        require("formatter.filetypes.javascriptreact").prettier
                },
                typescript = {
                        require("formatter.filetypes.typescript").prettier
                },
                json = {
                        require("formatter.filetypes.json").prettier
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
