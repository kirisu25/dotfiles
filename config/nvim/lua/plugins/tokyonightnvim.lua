return {
    "folke/tokyonight.nvim",
    lazy = true,
    event = "VimEnter",
    priority = 1000,
    opts = {
        style = "night",
        transparent = true,
        terminal_colors = true,
        styles = {
            sidebars = "transparent",
            floats = "transparent",
        },
    },
    config = function()
         vim.cmd[[colorscheme tokyonight]]
    end
}
