local h = require("util.helper")
local capabilities = require("ddc_source_lsp").make_client_capabilities()
local on_attach = function(client)
	client.server_capabilities.documentFormattingProvider = false
end

return {
	"neovim/nvim-lspconfig",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "williamboman/mason-null-ls.nvim" },
		{ "nvimtools/none-ls.nvim" },
		{ "nvim-lua/plenary.nvim" },
	},
	config = function()
		-- mason
		require("mason").setup()
		require("mason-lspconfig").setup()
		require("mason-lspconfig").setup_handlers({
			function(server) --default handler (optional)
				require("lspconfig")[server].setup({
					on_attach = on_attach,
                    settings = {
                        ["rust-analyzer"] = {
                            checkOnSave = {false},
                        },
                    },
				})
			end,
		})
		local null_ls = require("null-ls")
		null_ls.setup()
		require("mason-null-ls").setup({
			ensure_installed = { "stylua", "prettierd", "goimports" },
			handlers = {
				function() end, -- disables automatic setup of all null-ls sources
---@diagnostic disable-next-line: unused-local
				stylua = function(source_name, methods)
					null_ls.register(null_ls.builtins.formatting.stylua)
				end,
---@diagnostic disable-next-line: unused-local
				prettierd = function(source_name, methods)
					null_ls.register(null_ls.builtins.formatting.prettierd)
				end,
---@diagnostic disable-next-line: unused-local
				goimports = function(source_name, methods)
					null_ls.register(null_ls.builtins.formatting.goimports)
				end,
			},
		})

		-- nvim-lspconfig
		require("lspconfig").denols.setup({
			capabilities = capabilities,
		})
		vim.lsp.handlers["textDocument/publishDiagnostics"] =
			vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false })
		-- keymap
		h.nmap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
		h.nmap("H", "<cmd>lua vim.lsp.buf.hover()<CR>")
		h.nmap("g[", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
		h.nmap("g]", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
		h.nmap("ge", "<cmd>lua vim.diagnostic.open_float()<CR>")
		h.nmap("<F2>", "<cmd>lua vim.lsp.buf.rename()<CR>")
		h.nmap("ga", "<cmd>lua vim.lsp.buf.code_action()<CR>")
		h.nmap("gr", "<cmd>lua vim.lsp.buf.references()<CR>")
		h.nmap("gf", function()
			vim.lsp.buf.format({ asyc = true })
		end)
	end,
}
