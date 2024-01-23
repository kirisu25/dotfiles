return {
    "folke/tokyonight.nvim",
    lazy = true,
    event = "VimEnter",
    priority = 1000,
    opts = {
        style = "night",
        transparent = true,
        styles = {
            sidebars = "transparent",
            floats = "transparent",
        },
    },
    config = function()
         vim.cmd[[colorscheme tokyonight]]
    end
}
