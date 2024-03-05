local h = require("util.helper")

return {
  'szkny/Ipython',
  lazy = true,
  ft = {"py"},
  config = function()
    h.nmap("ip", "<cmd>Ipython<CR>")
    h.vmap("ip", "<cmd>VIpython<CR>")
  end
}
