return {
  "karb94/neoscroll.nvim",
  lazy = false,
  enabled = true,
  opts = function(_, _)
    local t = {}
    t["<C-k>"] = { "scroll", { -12, "true", "125", [['sine']] } }
    t["<C-j>"] = { "scroll", { 12, "true", "125", [['sine']] } }
    -- Use the "circular" easing function
    t["<C-b>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "225", [['sine']] } }
    t["<C-f>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "225", [['sine']] } }
    -- Pass "nil" to disable the easing animation (constant scrolling speed)
    t["<C-y>"] = { "scroll", { "-0.10", "false", "125", [['sine']] } }
    t["<C-e>"] = { "scroll", { "0.10", "false", "125", [['sine']] } }
    -- When no easing function is provided the default easing function (in this case "quadratic") will be used
    t["zt"] = { "zt", { "50" }, [['sine']] }
    t["zz"] = { "zz", { "50" }, [['sine']] }
    t["zb"] = { "zb", { "50" }, [['sine']] }

    require("neoscroll.config").set_mappings(t)
    return {
      -- -- All these keys will be mapped to their corresponding default scrolling animation
      hide_cursor = false, -- Hide cursor while scrolling
      stop_eof = false, -- Stop at <EOF> when scrolling downwards
      -- use_local_scrolloff = true, -- Use the local scope of scrolloff instead of the global scope
      respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
      cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
      easing_function = nil, -- Default easing function
    }
  end,
}
