return
{
  {
    "folke/todo-comments.nvim",
    opts = {
      -- show icons in the signs column
      signs = false,
      highlight = {
        -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty.
        -- (wide and wide_bg is the same as bg, but will also highlight
        -- surrounding characters, wide_fg acts accordingly but with fg)
        keyword = "bg",
        -- pattern or table of patterns, used for highlighting (vim regex)
        pattern = [[.*<(KEYWORDS)\s*]],
      },
      search = {
        -- match without the extra colon. You'll likely get false positives
        pattern = [[\b(KEYWORDS)\b]],
      },
    }
  },
  {
    -- "gc" to comment fisual regions/lines
    'numToStr/Comment.nvim',
    opts = {}
  }
}
