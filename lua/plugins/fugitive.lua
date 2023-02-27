return {
  "tpope/vim-fugitive",
  cmd = {
    "Git",
    "Gdiff",
    "Gdiffsplit",
    "Gvdiffsplit",
    "Gwrite",
    "Gw",
  },
  keys = function()
    return {
      { "<leader>gb", "<Cmd>:Git blame<CR>", desc = "Git blame" },
      { "<leader>gd", "<Cmd>:Git diff<CR>", desc = "Git diff" },
    }
  end,
}
