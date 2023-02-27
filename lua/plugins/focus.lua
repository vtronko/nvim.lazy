return {
  "beauwilliams/focus.nvim",
  cmd = {
    "FocusToggle",
    "FocusEqualize",
  },
  config = function()
    require("focus").setup()
  end,
  keys = {
    { "<leader>ft", "<Cmd>:FocusToggle<CR>", desc = "Toggle focus mode" },
  },
}
