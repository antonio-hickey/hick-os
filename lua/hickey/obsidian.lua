require("obsidian").setup({
  workspaces = {
    {
      name = "work",
      path = "~/work/knowledge-base",
    },
    {
      name = "personal",
      path = "TODO: get personal path at home",
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
