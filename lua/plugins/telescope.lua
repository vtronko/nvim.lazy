local function git_fd_or_cwd()
  local git_root = require("lspconfig.util").find_git_ancestor(vim.api.nvim_buf_get_name(0))
  return git_root
end

return {
  "nvim-telescope/telescope.nvim",
  config = function(_, opts)
    local colors = Everforest_Colors
    Setup_everforest_highlights({
      TelescopePreviewBorder = { fg = colors.grey },
      TelescopePromptBorder = { fg = colors.line },
      TelescopeResultsBorder = { fg = colors.line },

      TelescopeTitle = { bg = colors.pmenu_bg },
      TelescopePromptTitle = { bg = colors.teal},
      TelescopeResultsTitle = { bg = colors.teal},
    })

    require("telescope").setup(opts)
  end,
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },
  keys = function()
    return {
      {
        "<leader>bb",
        function()
          require("telescope.builtin").buffers()
        end,
        "Buffers",
      },
      {
        "<leader>fd",
        function()
          require("telescope.builtin").find_files{ cwd = git_fd_or_cwd() }
        end,
        "Find Files",
      },
      {
        "<leader>rg",
        function()
          require("telescope.builtin").live_grep({ cwd = git_fd_or_cwd() })
        end,
        "Live Grep",
      },
      {
        "<leader>gc",
        function()
          require("telescope.builtin").git_commits()
        end,
        "Git commits",
      },
      {
        "<leader>gs",
        function()
          require("telescope.builtin").git_status()
        end,
        "Git commits",
      },
      {
        "<leader>hh",
        function()
          require("telescope.builtin").oldfiles()
        end,
        "Old files",
      },
      {
        "<leader>gr",
        function()
          require("telescope.builtin").lsp_references()
        end,
        "Lsp References",
      },
      {
        "<leader>ls",
        function()
          require("telescope.builtin").lsp_dynamic_workspace_symbols()
        end,
        "Lsp Dynamic Symbols",
      },

    }
  end,
  -- change some options
  opts = {
    defaults = {
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
      },
      prompt_prefix = "   ",
      selection_caret = "  ",
      entry_prefix = "  ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "ascending",
      layout_strategy = "vertical",
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
          results_width = 0.8,
        },
        vertical = {
          height = 0.9,
          preview_height = 0.5,
          preview_cutoff = 0,
          prompt_position = "bottom",
          width = 0.8,
        },
        width = 0.6,
        height = 0.80,
        preview_cutoff = 120,
      },

      file_sorter = require("telescope.sorters").get_fuzzy_file,
      file_ignore_patterns = {},
      generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
      path_display = { "smart" },
      winblend = 0,
      border = {},
      borderchars = {'─', '│', '─', '│', '┌', '┐', '┘', '└'},
      color_devicons = true,
      use_less = true,
      set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil
      file_previewer = require("telescope.previewers").vim_buffer_cat.new,
      -- require("telescope.previewers").vim_buffer_cat.new,
      grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
      qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
      -- Developer configurations: Not meant for general override
      buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    },
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      },
    },
  },
}
