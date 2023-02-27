return {
  "neovim/nvim-lspconfig",
  opts = {
    autoformat = false,
    servers = {
      -- pyright will be automatically installed with mason and loaded with lspconfig
      clangd = {},
      pyright = {},
    },
  },
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- ignore defaults
    for k in pairs(keys) do
      keys[k] = nil
    end

    -- map("n", "<leader>ca", "<cmd>copen<cr>", { desc = "Quickfix List" })

    keys[#keys + 1] = { "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>" }
    keys[#keys + 1] = { "gd", "<cmd>lua vim.lsp.buf.definition()<CR>" }
    keys[#keys + 1] = { "gsd", "<cmd>vsplit | lua vim.lsp.buf.definition()<CR>" }
    keys[#keys + 1] = { "gxd", "<cmd>split | lua vim.lsp.buf.definition()<CR>" }
    keys[#keys + 1] = { "gh", "<cmd>ClangdSwitchSourceHeader<CR>" }
    keys[#keys + 1] = { "K", "<cmd>lua vim.lsp.buf.hover()<CR>" }
    keys[#keys + 1] = { "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>" }
    keys[#keys + 1] = { "<leader>gk", "<cmd>lua vim.lsp.buf.signature_help()<CR>" }

    keys[#keys + 1] = { "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>" }
    keys[#keys + 1] = { "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>" }
    keys[#keys + 1] = { "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>" }
    keys[#keys + 1] = { "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>" }
    keys[#keys + 1] = { "<leader>ed", "<cmd>lua vim.diagnostic.show_line_diagnostics()<CR>" }
    keys[#keys + 1] = { "<leader>ed", "<cmd>lua vim.diagnostic.open_float()<CR>" }
    keys[#keys + 1] = { "<leader>ep", "<cmd>lua vim.diagnostic.goto_prev()<CR>" }
    keys[#keys + 1] = { "<leader>en", "<cmd>lua vim.diagnostic.goto_next()<CR>" }
    keys[#keys + 1] = { "<leader>fm", "<cmd>lua vim.lsp.buf.format({async = true})<CR>" }
    keys[#keys + 1] = { "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>" }

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      -- Use a sharp border with `FloatBorder` highlights
      border = "single",
    })
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      -- Use a sharp border with `FloatBorder` highlights
      border = "single",
    })

    local colors = Everforest_Colors
    Setup_everforest_highlights({
      FloatBorder = { fg = colors.line },
      NormalFloat = { bg = Everforest_Colors.code_bg },
    })
  end,
}
