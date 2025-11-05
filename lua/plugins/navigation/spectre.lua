return {
  "nvim-pack/nvim-spectre",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("spectre").setup({
      mapping = {
        ["run_replace"] = {
          map = "r",
          cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
          desc = "Replace all matches",
        },
        ["run_current_replace"] = {
          map = "<CR>",
          cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
          desc = "Replace current match",
        },
        ["close"] = {
          map = "q",
          cmd = "<cmd>lua require('spectre.actions').close()<CR>",
          desc = "Close Spectre",
        },
      },
    })
  end,
}

