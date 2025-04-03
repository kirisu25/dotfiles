return {
  {
    name = "neo-tree.nvim",
    dir = "@neo_tree_nvim@",
    dependencies = {
      { name = "nui.nvim", dir = "@nui_nvim@" },
      { name = "nvim-web-devicons", dir = "@nvim_web_devicons@" },
      { name = "plenary.nvim", dir = "@plenary_nvim@" },
    },
    cmd = { "Neotree" },
    init = function()
      vim.g.neo_tree_remove_lagacy_commands = 1
      vim.keymap.set("n", "<LEADER>e", ":Neotree toggle<CR>")
    end,
    config = true,
  },
  {
    name = "nvim-autopairs",
    dir = "@nvim_autopairs@",
    event = "InsertEnter",
    config = true,
  },
  {
    name = "telescope.nvim",
    dir = "@telescope_nvim@",
    dependencies = { name = "plenary.nvim", dir = "@plenary_nvim@" },
    cmd = "Telescope",
    keys = {"<LEADER>f"},
    config = function()
      local telescope = require("telescope")
      -- local trouble = require("trouble.providers.telescope")
      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "<LEADER>ff", builtin.find_files, {})
      vim.keymap.set("n", "<LEADER>fg", builtin.live_grep, {})
      vim.keymap.set("n", "<LEADER>fb", builtin.buffers, {})
      vim.keymap.set("n", "<LEADER>fh", builtin.help_tags, {})

      -- telescope.setup({
      --   defaults = {
      --     mappings = {
      --       i = {["<c-t>"] = trouble.open_with_trouble },
      --       n = {["<c-t>"] = trouble.open_with_trouble },
      --     },
      --   },
      -- })
    end,
  },
}
