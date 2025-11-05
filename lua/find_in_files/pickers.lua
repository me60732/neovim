local M = {}
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local conf = require("telescope.config").values

M.select_include_path = function(on_select)
  local paths = vim.fn.glob("**/", 0, 1)

  pickers.new({}, {
    prompt_title = "Include Path",
    finder = finders.new_table({ results = paths }),
    sorter = conf.generic_sorter({}),
    attach_mappings = function(prompt_bufnr, map)
      map("i", "<CR>", function()
        local selection = action_state.get_selected_entry()
        local picker = action_state.get_current_picker(prompt_bufnr)
        picker:close()
        on_select(selection[1])
      end)
      return true
    end,
  }):find()
end


return M

