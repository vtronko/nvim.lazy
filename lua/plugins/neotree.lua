return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = function()
      return {
        {
          "<leader>tt",
          function()
            require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
          end,
          desc = "Explorer NeoTree (cwd)",
        },
      }
    end,
    opts = {
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = true,
      },
      window = {
        position = "right",
        mappings = {
          ["<space>"] = "none",
        },
      },
      default_component_configs = {
        indent = {
          with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
      },
    },
  },
  {
    "s1n7ax/nvim-window-picker",
    config = function()
      require("window-picker").setup({
        fg_color = Everforest_Colors.code_bg,
        current_win_hl_color = Everforest_Colors.red,
        -- all the windows except the curren window will be highlighted using this
        -- color
        other_win_hl_color = Everforest_Colors.vibrant_green,
      })
    end,
  },
}
