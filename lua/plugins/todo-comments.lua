return {
  "folke/todo-comments.nvim",
  disable = true,
  cmd = { "TodoTrouble", "TodoTelescope" },
  event = { "BufReadPost", "BufNewFile" },
  config = true,
  -- opts = {
  --   colors = {
  --     todo = { "dsfdsf", "dsdf", "#ff0000"},
  --     error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
  --     warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
  --     info = { "DiagnosticInfo", "#2563EB" },
  --     hint = { "DiagnosticHint", "#10B981" },
  --     default = { "Identifier", "#7C3AED" },
  --     test = { "Identifier", "#FF00FF" },
  --   },
  -- },
  -- stylua: ignore
  keys = function()
    return {
      { "<leader>td", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
    }
  end,
}
