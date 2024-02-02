return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		null_ls.setup({
			sources = {
                -- Lua
				null_ls.builtins.formatting.stylua,
                null_ls.builtins.diagnostics.luacheck,
                -- JS/TS
				null_ls.builtins.diagnostics.eslint_d,
                null_ls.builtins.formatting.prettier,
                -- Go
                null_ls.builtins.formatting.gofumpt,
                null_ls.builtins.formatting.golines,
                null_ls.builtins.formatting.goimports,
                null_ls.builtins.formatting.goimports_reviser,
                null_ls.builtins.diagnostics.golangci_lint,
                -- Rust
                null_ls.builtins.formatting.rustfmt,
                    -- leptos
                null_ls.builtins.formatting.leptosfmt,
                -- CSS
                null_ls.builtins.diagnostics.stylint,
                null_ls.builtins.formatting.stylelint,
			},

            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format()
                        end,
                    })
                end
            end,
        })
		vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {})
	end,
}
