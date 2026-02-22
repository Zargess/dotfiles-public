return {
  {
    "stevearc/oil.nvim",
    keys = {
    { "<leader>o", "<cmd>Oil --float<CR>", desc = "Explorer" },
      -- { "<leader>o", "<cmd>Oil <CR>", desc = "Explorer" },
    },
    opts = {
      view_options = {
        show_hidden = true,
      },
      float = {
        padding = 5,
      },
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "benomahony/oil-git.nvim",
    dependencies = { "stevearc/oil.nvim" },
    -- No opts or config needed! Works automatically
  }
}
