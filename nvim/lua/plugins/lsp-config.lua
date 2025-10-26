return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            -- local lspconfig = require("lspconfig")
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "denols",
                    "eslint",
                    "gopls",
                    "lua_ls",
                    "tailwindcss",
                    "ts_ls",
                    "pyright",
                    "clangd",
                },
                automatic_enable = false,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Adding custom border --
            local border = {
                { "🭽", "FloatBorder" },
                { "▔", "FloatBorder" },
                { "🭾", "FloatBorder" },
                { "▕", "FloatBorder" },
                { "🭿", "FloatBorder" },
                { "▁", "FloatBorder" },
                { "🭼", "FloatBorder" },
                { "▏", "FloatBorder" },
            }

            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
            vim.lsp.handlers["textDocument/signatureHelp"] =
                vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })

            local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
            function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
                opts = opts or {}
                opts.border = opts.border or border
                return orig_util_open_floating_preview(contents, syntax, opts, ...)
            end

            -- End of adding custom border --
            vim.lsp.enable("denols")
            -- vim.lsp.config("denols", {
            -- 	capabilities = capabilities,
            -- TODO: need to figure this out
            -- root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
            --
            -- })
            -- lspconfig.denols.setup({
            -- })

            vim.lsp.enable("lua_ls")
            -- lspconfig.lua_ls.setup({
            -- 	capabilities = capabilities,
            -- })

            vim.lsp.enable("gopls")
            -- vim.lsp.config("gopls", {
            -- 	capabilities = capabilities,
            -- })
            -- lspconfig.gopls.setup({
            -- 	capabilities = capabilities,
            -- })

            vim.lsp.enable("ts_ls")
            -- vim.lsp.config("ts_ls", {})
            -- lspconfig.ts_ls.setup({
            -- 	capabilities = capabilities,
            --
            -- 	TODO: should probably also figure this out
            -- 	root_dir = lspconfig.util.root_pattern("package.json"),
            -- 	single_file_support = false,
            -- })

            vim.lsp.enable("pyright")
            -- vim.lsp.config("pyright", {})
            -- lspconfig.pyright.setup({
            -- 	capabilities = capabilities,
            -- })

            vim.lsp.enable("tailwindcss")
            -- vim.lsp.config("tailwindcss", {})
            -- lspconfig.tailwindcss.setup({
            -- 	capabilities = capabilities,
            -- })

            vim.lsp.enable("clangd")
            -- vim.lsp.config("clangd", {})
            -- lspconfig.clangd.setup({
            -- 	capabilities = capabilities,
            -- 	command = {
            -- 		"--ofset-encoding=utf-8",
            -- 	},
            -- })

            vim.lsp.enable("eslint")
            -- vim.lsp.config("eslint", {})
            -- lspconfig.eslint.setup({
            -- 	settings = {
            -- 		packageManager = "npm",
            -- 	},
            -- 	root_dir = function(fname)
            -- 		return lspconfig.util.root_pattern("frontend/package.json", "./package.json")(fname)
            -- 			or vim.fn.getcwd()
            -- 	end,
            -- 	capabilities = capabilities,
            -- 	on_attach = function(client, bufnr)
            -- 		vim.api.nvim_create_autocmd("BufWritePre", {
            -- 			buffer = bufnr,
            -- 			command = "EslintFixAll",
            -- 		})
            -- 	end,
            -- })

            -- Keymaps
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
}
