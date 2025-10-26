return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		null_ls.setup({
			debug = true,
			sources = {
				-- Lua
				null_ls.builtins.formatting.stylua,
				-- JS/TS
				null_ls.builtins.formatting.prettier, -- THIS ONE
				require("none-ls.diagnostics.eslint"), --THIS ONE
				-- Go
				null_ls.builtins.formatting.gofumpt,
				null_ls.builtins.formatting.golines,
				null_ls.builtins.formatting.goimports,
				null_ls.builtins.formatting.goimports_reviser,
				null_ls.builtins.diagnostics.golangci_lint,
				-- Rust
				-- null_ls.builtins.formatting.rustfmt, -- this is deprecated from Mason, but will keep it here
				-- -- leptos
				-- null_ls.builtins.formatting.leptosfmt,
				-- CSS
				-- null_ls.builtins.diagnostics.stylint,
				-- null_ls.builtins.formatting.stylelint,
				-- Python
				null_ls.builtins.formatting.black,
				null_ls.builtins.diagnostics.pylint,
				-- C
				null_ls.builtins.formatting.clang_format.with({
					extra_args = { "--style=file" },
				}),
				null_ls.builtins.diagnostics.cmake_lint,
			},

			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ async = false })
							-- vim.lsp.buf.format({ async = false })
							-- vim.lsp.buf.format()
							-- vim.lsp.buf.formatting_sync()
						end,
					})
				end
				if client.name == "eslint" then
					print("eslint client")
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						command = "EslintFixAll",
					})
				end

				vim.diagnostic.config({ virtual_lines = { current_line = true }, virtual_text = false })
			end,
		})
		vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {})
	end,
}
