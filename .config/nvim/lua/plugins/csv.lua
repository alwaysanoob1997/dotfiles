return {
  {
    "hat0uma/csvview.nvim",
    ft = { "csv", "tsv" },
    opts = {
      parser = {
        comments = { "#", "//" },
        delimiter = {
          ft = {
            csv = ",",
            tsv = "\t",
          },
        },
      },
      view = {
        display_mode = "border",
        header_lnum = 1,
      },
    },
  },
}
