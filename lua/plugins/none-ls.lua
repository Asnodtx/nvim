return {
	"nvimtools/none-ls.nvim",
	event = "VeryLazy",
	opts = function()
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		local null_ls = require("null-ls")

		local opts = {
			sources = {
				-- Añadir más fuentes de formateo o linting si es necesario
				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.clang_format.with({
					filetypes = { "java" }, -- Solo para archivos Java
				}),
			},
			on_attach = function(client, bufnr)
				-- Verificar si el cliente LSP soporta formateo
				if client.supports_method("textDocument/formatting") then
					-- Limpiar autocmds previos para evitar duplicados
					vim.api.nvim_clear_autocmds({
						group = augroup,
						buffer = bufnr,
					})

					-- Crear autocmd para formatear antes de guardar el archivo
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr, async = false })
						end,
					})
				end
			end,
		}

		-- Keymap para formateo manual con <leader>gf
		vim.keymap.set("n", "<leader>gf", function()
			vim.lsp.buf.format({ async = true }) -- Asincrónico para evitar bloqueos
		end, { desc = "Formatear el buffer actual con LSP" })

		return opts
	end,
}

