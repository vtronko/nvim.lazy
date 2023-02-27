return {
  "nvim-treesitter/nvim-treesitter",
  keys = function()
    return {}
  end,
  opts = {
    ensure_installed = {
      "bash",
      "c",
      "cpp",
      "help",
      "html",
      "http",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "regex",
      "sql",
      "vim",
      "yaml",
    },
    matchup = {
      enable = true,
    },
    rainbow = {
      enable = true,
      extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
      max_file_lines = nil, -- Do not enable for files with more than n lines, int
      colors = {
        "#a7c080",
        "#dbbc7f",
        "#d699b6",
        "#83c092",
        "#d3c6aa",
      },
      termcolors = {
        "Red",
        "Green",
        "Yellow",
        "Blue",
        "Magenta",
        "Cyan",
        "White",
      }, -- table of hex strings
      -- termcolors = {} -- table of colour name strings
    },
  },
}
