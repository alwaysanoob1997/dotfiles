return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      enabled = true,

      heading = {
        enabled = true,
        sign = true,
        position = "overlay",
        icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
      },

      code = {
        enabled = true,
        style = "full",
        position = "left",
        border = "thin",
        width = "block",
        left_pad = 1,
        right_pad = 1,
      },

      bullet = {
        enabled = true,
        icons = { "●", "○", "◆", "◇" },
      },

      checkbox = {
        enabled = true,
        unchecked = {
          icon = "󰄱 ",
        },
        checked = {
          icon = "󰱒 ",
        },
      },

      quote = {
        enabled = true,
        icon = "▋",
      },

      pipe_table = {
        enabled = true,
        preset = "round",
        style = "full",
      },

      link = {
        enabled = true,
        image = "󰥶 ",
        email = "󰀓 ",
        hyperlink = "󰌷 ",
        custom = {
          web = { pattern = "^https?://", icon = "󰖟 " },
        },
      },
    },
  },
}
