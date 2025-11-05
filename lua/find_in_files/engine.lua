local M = {}

M.run = function(params)
  require("fin_in_files.utils").write_ignore_file(params.exclude, params.ignore)

  require("spectre").open({
    search_text = params.find,
    replace_text = params.replace ~= "" and params.replace or nil,
    path = params.include,
    is_insert_mode = false,
  })
end

return M

