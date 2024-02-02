return {
  "norcalli/nvim-colorizer.lua",
  lazy = true,
  ft = {"html", "css", "lua"},
  config = function()
    require("colorizer").setup()
  end
}
