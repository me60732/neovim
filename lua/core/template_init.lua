return function(mod_dir)
  -- Auto-detect caller's module path if not provided
  if not mod_dir then
    for level = 2, 5 do
      local info = debug.getinfo(level, "S")
      if info and info.source and info.source:sub(1, 1) == "@" then
        local path = info.source:sub(2)
        local lua_root = vim.fn.stdpath("config") .. "/lua/"
        if path:sub(1, #lua_root) == lua_root and path:match("init%.lua$") then
          mod_dir = path:sub(#lua_root + 1):gsub("/", "."):gsub("%.init%.lua$", "")
          break
        end
      end
    end
  end

  local collected = {}
  local base_path = vim.fn.stdpath("config") .. "/lua/"
  local dir_path = base_path .. mod_dir:gsub("%.", "/")

  for _, file in ipairs(vim.fn.globpath(dir_path, "**/*.lua", false, true)) do
    local rel_path = file:sub(#base_path + 1):gsub("/", "."):gsub("%.lua$", "")
    if rel_path ~= "core.template_init" then
      --print("Trying to load:", rel_path)
      local ok, mod = pcall(require, rel_path)
      --print("Result for", rel_path, ":", ok, vim.inspect(mod))
      if ok and mod ~= nil then
        if type(mod) == "table" then
          table.insert(collected, mod)
        elseif type(mod) == "function" then
          local result = mod()
          if result ~= nil then
            table.insert(collected, result)
          end
        end
      end
    end
  end

  --print("Collected from", mod_dir or "unknown", vim.inspect(collected))
  return collected
end

