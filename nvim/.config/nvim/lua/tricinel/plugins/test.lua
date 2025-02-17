return {
  {
    "nvim-neotest/neotest",
    dependencies = { "marilari88/neotest-vitest" },
    keys = {
      {
        "<leader>tl",
        function()
          require("neotest").run.run_last()
        end,
        desc = "Run last test",
      },
      opts = {
        adapters = {
          ["neotest-vitest"] = {},
        },
      },
    },
  },
}
