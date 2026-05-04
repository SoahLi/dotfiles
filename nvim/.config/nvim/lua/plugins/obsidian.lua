return {
  "obsidian-nvim/obsidian.nvim",
  lazy = false,
  version = "*", -- recommended, use latest release instead of latest commit
  ft = "markdown",
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false, -- this will be removed in the next major release
    workspaces = {
      {
        name = "mixxx",
        path = "~/obsidian_vaults/mixxx/",
      },
      {
        name = "mixxx",
        path = "~/obsidian_vaults/Cpp",
      },
    },
  },
}
