local h = require("util.helper")

local on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
    h.nmap('gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
    h.nmap('H', '<cmd>lua vim.lsp.buf.hover()<CR>')
    h.nmap('g[', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
    h.nmap('g]', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
    h.nmap('gf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
end


return {
    'neovim/nvim-lspconfig',
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        {
            'williamboman/mason-lspconfig.nvim',
            cmd = { "LspInstall", "LspUninstall" },
        },
    },
    init = function()
        require("mason").setup()
        require("mason-lspconfig").setup()
        require("mason-lspconfig").setup_handlers({
            function(server) --default handler (optional)
                require("lspconfig")[server].setup {
                    on_attach = on_attach,
                }
            end
        })

        vim.lsp.handlers["textDocument/publishDiagnostics"] =
            vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,  { virtual_text = false })
    end
}
