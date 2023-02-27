return {
  "akinsho/bufferline.nvim",
  cond = not vim.g.started_by_firenvim,
  keys = function()
    return {
      { "<leader>bp",  "<Cmd>BufferLineCyclePrev<CR>",            desc = "Cycle prev" },
      { "<leader>bn",  "<Cmd>BufferLineCycleNext<CR>",            desc = "Cycle next" },
      { "<leader>bP",  "<Cmd>BufferLineTogglePin<CR>",            desc = "Toggle pin" },
      { "<leader>bPd", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Toggle pin" },
    }
  end,
  opts = {
    options = {
      always_show_bufferline = true,
      separator_style = "thin",
      -- view = "multiwindow",
      offsets = {
        text_align = "left",
        separator = true,
      },
      show_buffer_close_icons = false,
      max_name_length = 20,
      max_prefix_length = 0,
      tab_size = 20,
    },
  },
  config = function(_, opts)
    require("bufferline").setup(opts)

    -- local colors = Everforest_Colors
    -- Setup_everforest_highlights({
    --   BufferLineBackground = {
    --     fg = colors.light_grey,
    --     bg = colors.black2,
    --   },
    --   BufferLineCloseButton = {
    --     fg = colors.grey,
    --     bg = colors.black2,
    --   },
    --   BufferLineBufferSelected = {
    --     fg = colors.white,
    --     bg = colors.code_bg,
    --   },
    --   BufferLineBufferVisible = {
    --     fg = colors.light_grey,
    --     bg = colors.black2,
    --   },
    -- })
  end,
}
