local M = {}

local function prompt(label, default, callback)
  vim.ui.input({ prompt = label, default = default or "" }, function(input)
    callback(input or "")
  end)
end

M.launch = function()
  prompt("Find:", nil, function(find)
    if find == "" then return end

    prompt("Replace (optional):", nil, function(replace)
      prompt("Include path (optional):", "", function(include)
        prompt("Exclude path(s) (comma-separated, optional):", nil, function(exclude)
          prompt("Ignore patterns (e.g. .git,node_modules):", nil, function(ignore)

            -- TODO: handle exclude and ignore logic
            require("spectre").open({
              search_text = find,
              replace_text = replace ~= "" and replace or nil,
              path = include,
              is_insert_mode = false,
            })

          end)
        end)
      end)
    end)
  end)
end

return M

