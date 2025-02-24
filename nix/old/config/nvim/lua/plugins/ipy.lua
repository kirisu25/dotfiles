local h = require("util.helper")

return {
  'szkny/Ipython',
  lazy = true,
  ft = {"python"},
  dependencies = {
    {'szkny/SplitTerm'},
  },
  config = function()
    h.nmap("<Leader>g", "<cmd>Ipython<CR>")
    h.vmap("<Leader>g", "<cmd>VIpython<CR>")
  end
}
