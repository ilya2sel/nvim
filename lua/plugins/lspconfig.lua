return {
    "neovim/nvim-lspconfig",
    config = function()
        -- Global capabilities (nvim-cmp integration)
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        vim.lsp.config('*', {
            capabilities = capabilities,
        })

        -- Per-server tweaks
        vim.lsp.config('eslint', {
            settings = {
                format = false,
            },
        })
        vim.lsp.config('lua_ls', {
            settings = {
                Lua = {
                    runtime = { version = 'LuaJIT' },
                    diagnostics = { globals = { 'vim' } },
                    workspace = {
                        checkThirdParty = false,
                        library = { vim.env.VIMRUNTIME },
                    },
                    telemetry = { enable = false },
                },
            },
        })

        -- Manually enable servers
        vim.lsp.enable({
            "lua_ls",
            "bashls",
            "jsonls",
            "docker_language_server",
            "docker_compose_language_service",
            "marksman",
            "pyright",
            "yamlls",
            "phpactor",
            "ts_ls",
            "vue_ls",
            "tailwindcss",
            "eslint",
            "prismals"
        })
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspKeymaps', { clear = true }),
            callback = function(args)
                local bufnr = args.buf
                local bufopts = { buffer = bufnr, remap = false }
                local keymaps = {
                    { "n", "gd", vim.lsp.buf.definition, "Go to definition" },
                    { "n", "K", vim.lsp.buf.hover, "Hover information" },
                    { "n", "[d", vim.diagnostic.goto_next, "Next diagnostic" },
                    { "n", "]d", vim.diagnostic.goto_prev, "Previous diagnostic" },
                    { "n", "gr", vim.lsp.buf.references, "References" },
                    { "n", "gl", vim.diagnostic.open_float, "Show line diagnostics" },
                    { "n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol" },
                }
                for _, km in ipairs(keymaps) do
                    vim.keymap.set(km[1], km[2], km[3], vim.tbl_extend('force', bufopts, { desc = km[4] }))
                end
            end,
        })

        vim.diagnostic.config({
            virtual_text = true,
        })
    end,
}
