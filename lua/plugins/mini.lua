return {
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {
      -- Module mappings. Use `''` (empty string) to disable one.
      mappings = {
        -- Toggle comment (like `gcip` - comment inner paragraph) for both
        -- Normal and Visual modes
        comment = "<leader>//",

        -- Toggle comment on current line
        comment_line = "<leader>//",

        -- Define 'comment' textobject (like `dgc` - delete whole comment block)
        textobject = "<leader>//",
      },
      hooks = {
        pre = function()
          require("ts_context_commentstring.internal").update_commentstring({})
        end,
      },
    },
  },
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function()
      -- don't use animate when scrolling with the mouse
      local mouse_scrolled = false
      for _, scroll in ipairs({ "Up", "Down" }) do
        local key = "<ScrollWheel" .. scroll .. ">"
        vim.keymap.set({ "", "i" }, key, function()
          mouse_scrolled = true
          return key
        end, { expr = true })
      end

      local animate = require("mini.animate")
      return {
        cursor = {
          enable = false,
        },
        resize = {
          enable = false,
          timing = animate.gen_timing.linear({ duration = 50, unit = "total" }),
        },
        scroll = {
          enable = false,
          timing = animate.gen_timing.linear({ duration = 150, unit = "total" }),
          subscroll = animate.gen_subscroll.equal({
            predicate = function(total_scroll)
              if mouse_scrolled then
                mouse_scrolled = false
                return false
              end
              return total_scroll > 1
            end,
          }),
        },
      }
    end,
    config = function(_, opts)
      require("mini.animate").setup(opts)
    end,
  },
  {
    "echasnovski/mini.bufremove",
    keys = function()
      return {
        {
          "<leader>x",
          function()
            require("mini.bufremove").delete(0, false)
          end,
          desc = "Delete Buffer",
        },
        {
          "<leader>X",
          function()
            require("mini.bufremove").delete(0, true)
          end,
          desc = "Delete Buffer (Force)",
        },
      }
    end,
  },
}
