
local M = {}

local ui = require("find_in_files.ui")
local engine = require("find_in_files.engine")
local pickers = require("find_in_files.pickers")

M.launch = function()
  local cwd = vim.fn.getcwd()

  ui.prompt("Find:", nil, function(find)
    if find == "" then return end

    ui.prompt("Replace (optional):", nil, function(replace)
      pickers.select_include_path(function(include)
        ui.prompt("Exclude path(s) (comma-separated, optional):", nil, function(exclude)
          ui.prompt("Ignore patterns (e.g. .git,node_modules):", nil, function(ignore)
            engine.run({
              find = find,
              replace = replace,
              include = include or cwd,
              exclude = exclude,
              ignore = ignore,
            })
          end)
        end)
      end)
    end)
  end)
end

return M

