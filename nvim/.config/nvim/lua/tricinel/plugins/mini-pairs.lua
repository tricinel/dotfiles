return {
  "echasnovski/mini.pairs",
  event = "VeryLazy",
  opts = {
    modes = { insert = true, command = true, terminal = false },
    skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
    skip_ts = { "string" },
    skip_unbalanced = true,
    markdown = true,
    mappings = {
      ["`"] = false,
    },
  },
  config = function(_, opts)
    LazyVim.mini.pairs(opts)
  end,
}
