return {
  {
    name = "tokyonight.nvim",
    dir = "@tokyonight_nvim@",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
      { name = "nvim-web-devicons", dir = "@nvim_web_devicons@" },
      { name = "lualine.nvim", dir = "@lualine_nvim@" },
    },
    priority = 1000,
    opts = {
      style = "night",
      transparent = true,
      terminal_colors = true,
      style = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
    config = function()
      -- theme
      vim.cmd[[colorscheme tokyonight]]
      vim.cmd[[highlight Normal guibg=NONE ctermbg=NONE]]

      -- lualine
      require("tokyonight.colors")
      require("lualine").setup({
      options = {
        icons_enable = true,
        globalstatus = true,
        theme = "tokyonight",
        tabline = {},
      },
    })
    end,
  },
}
