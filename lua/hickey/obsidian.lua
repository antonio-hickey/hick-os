require("obsidian").setup({
  -- NOTE: If you're using my config for some reason
  -- you need to change these paths to wherever your
  -- obsidian workspace is located.
  workspaces = {
    {
      name = "work",
      path = "~/work/knowledge-base",
    },
    {
      name = "personal",
      path = "~/hick-vault",
    },
  },
  daily_notes = {
    folder = "notes/dailies",
    date_format = "%m/%d/%Y",
    alias_format = "%B %-d, %Y",
    default_tags = { "daily-notes" },
    -- TODO: Figure out how these templates work
    template = nil
  },
})
