return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				--python = { "isort", "black" },
				-- You can customize some of the format options for the filetype (:help conform.format)
				--rust = { "rustfmt", lsp_format = "fallback" },
				-- Conform will run the first available formatter
				--javascript = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				elixir = { "mix" },
				heex = { "mix" },
				cpp = { "clang_format" },
				python = { "ruff_organize_imports", "ruff_fix", "ruff_format" },
			},
			formatters = {
				clang_format = {
					-- Add specific args to clang-format here
					prepend_args = {
						"--style=file:/Users/owenturnbull/Documents/cs_projects/mixxx/.clang-format",
						"--verbose",
					},
				},
			},
		})
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		})
	end,
}
