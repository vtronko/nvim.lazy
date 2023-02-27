-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- vim.keymap.set("n", "q", "<cmd>:bd<cr>")
-- local map = require("config.util").map

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- navigate in insert mode
local insert_nav = {
  backward = "<C-h>",
  end_of_line = "<C-e>",
  forward = "<C-l>",
  next_line = "<C-k>",
  prev_line = "<C-j>",
  top_of_line = "<C-a>",
}

map("i", insert_nav.backward, "<Left>")
map("i", insert_nav.end_of_line, "<End>")
map("i", insert_nav.forward, "<Right>")
-- map("i", insert_nav.next_line, "<Up>")
-- map("i", insert_nav.prev_line, "<Down>")
map("i", insert_nav.top_of_line, "<ESC>^i")

-- Disable macros
map("n", "q", "<nop>")

-- quit
map("n", "<leader>Q", "<cmd>qa<cr>", { desc = "Quit all" })

-- tabs
-- map("n", "<leader>bc", ":enew <CR>") -- new buffer
map("n", "<leader>nt", ":tabnew<CR>", { desc = "New tab" })
map("n", "<leader>ct", ":tabclose<CR>", { desc = "Close tab" })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

map("n", "<leader>q", "<C-w>q", { desc = "Close window" })

-- Clear search with esc
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- lazy
-- map("n", "<leader>L", "<cmd>:Lazy<cr>", { desc = "Lazy" })
