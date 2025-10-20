return {
  "epwalsh/obsidian.nvim",
  version = "*",  -- latest stable
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "dev notes",
        path = "~/dev-notes",
      },
    },
  },
}

