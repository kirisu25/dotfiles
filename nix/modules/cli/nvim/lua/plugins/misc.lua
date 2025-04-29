return {
    name = "telescope.nvim",
    dir = "@telescope_nvim@",
  {
    name = "neo-tree.nvim",
    dir = "@neo_tree_nvim@",
    dependencies = {
      { name = "nui.nvim",          dir = "@nui_nvim@" },
      { name = "nvim-web-devicons", dir = "@nvim_web_devicons@" },
      { name = "plenary.nvim",      dir = "@plenary_nvim@" },
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
    name = "trouble.nvim",
    dir = "@trouble_nvim@",
    config = true,
    cmd = "Trouble",
  },
  {
    name = "telescope.nvim",
    dir = "@telescope_nvim@",
    dependencies = {
      { name = "plenary.nvim", dir = "@plenary_nvim@" },
      { name = "trouble.nvim", dir = "@trouble_nvim@" },
    },
    cmd = "Telescope",
    keys = { "<LEADER>f", "<LEADER>h" },
    config = function()
      local telescope = require("telescope")
      local open_with_trouble = require("trouble.sources.telescope").open()
      local builtin = require("telescope.builtin")
      local themes = require("telescope.themes")
      local helpTags = function()
        builtin.help_tags(themes.get_ivy())
      end

      vim.keymap.set("n", "<LEADER>ff", builtin.find_files, {})
      vim.keymap.set("n", "<LEADER>fg", builtin.live_grep, {})
      vim.keymap.set("n", "<LEADER>fb", builtin.buffers, {})
      vim.keymap.set("n", "<LEADER>fh", helpTags, {})

      telescope.setup({
        defaults = {
          mappings = {
            i = { ["<C-t>"] = open_with_trouble },
            n = { ["<C-t>"] = open_with_trouble },
          },
        },
      })
    end,
  },
  {
    name = "nvim-treesitter",
    dir = "@nvim_treesitter@",
    event = "BufRead",
    config = function()
      vim.opt.runtimepath:append("@ts_parser_dirs@")
    end,
  },
  {
    name = "toggleterm.nvim",
    dir = "@toggleterm_nvim@",
    event = "VeryLazy",
    config = function()
      require("toggleterm").setup {
        close_on_exit = true,
        direction = "float",
        insert_mappings = true,
        open_mapping = [[<c-/>]],
        persist_size = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        size = 100,
        start_in_insert = true,
      }
    end,

    vim.keymap.set("n", "<LEADER><c-/>", ":ToggleTerm size=10 direction=horizontal<CR>")
  },
  {
    name = "remote-nvim.nvim",
    dir = "@remote_nvim_nvim@",
    event = "CmdlineEnter",
    dependencies = {
      { name = "telescope.nvim", dir = "@telescope_nvim@",},
      { name = "plenary.nvim", dir = "@plenary_nvim@" },
      { name = "nui.nvim", dir = "@nui_nvim@" },
    },
    config = true,
  },
}
