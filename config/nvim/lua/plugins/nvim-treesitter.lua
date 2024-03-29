return {
    "folke/nvim-treesitter",
    lazy = true,
		ft = {
			"go",
			"rust",
			"lua",
      "python",
      "nix",
		},
--    event = { "BufReadPre", "BufNewFile" },
    config = function ()
        require'nvim-treesitter.configs'.setup {
            ensure_installed = {"lua", "vim", "vimdoc", "rust", "go", "python", "nix" },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        }
    end
}

