return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                -- Formatting
                null_ls.builtins.formatting.pint,
                null_ls.builtins.formatting.prettierd,
                null_ls.builtins.formatting.black,
            }
        })
    end,
}
