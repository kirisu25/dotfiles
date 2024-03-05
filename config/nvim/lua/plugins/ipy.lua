local h = require("util.helper")

return {
  'szkny/Ipython',
  lazy = true,
  ft = {"python"},
  dependencies = {
    {'szkny/SplitTerm'},
  },
  config = function()
    h.nmap("<Leader>ip", "<cmd>Ipython<CR>")
    h.vmap("<Leader>ip", "<cmd>VIpython<CR>")
  end
}
