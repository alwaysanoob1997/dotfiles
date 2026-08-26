-- lua/plugins/linting.lua
return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      markdown = {}, -- Removes markdownlint-cli2
    },
  },
}
