-- hoist util so they can be used in the module
local printf = function (formatString, ...)
  print(string.format("[SS2]: " .. formatString, ...))
end

local safeLoadModule = function (mName, suppressWarning)
  suppressWarning = suppressWarning or false

  if not mName then
      error("No module specified.")
  end

  local success, module = pcall(require, mName)
  if not success and not suppressWarning then
      printf("Module %s failed to load.\n%s", mName, module)
  end

  return success and module or nil

end
local isNixUser = function ()
    return os.getenv("NIX_PATH") ~= nil
end


return {

  -- returns whether the user is a Nix user or not
  isNixUser = isNixUser,

  -- keymap util
  nKeymap = function (key, map)
    vim.keymap.set("n", key, map, {noremap = true})
  end,
  iKeymap = function (key, map)
    vim.keymap.set("i", key, map, {noremap = true})
  end,

  -- naive, for relative paths only
  unixToWin64Path = function (unixPath)
    return string.gsub(unixPath, "/", "\\")
  end,

  printf = printf,

  -- module loading with graceful failure
  safeLoadModule = safeLoadModule,

  -- bootstrap a module, takes a table `m` expecting the keys:
  -- name: the modules require name
  -- ensure: install module if not installed
  -- install: a function that installs the module if need be
  -- configure: a function that configures the module if possible
  bootstrapModule = function (m)
    if not m.name then
      error("No module specified.")
    end

    if m.ensure then
        local module = safeLoadModule(m.name)
        if not module and not m.install then
          printf("No installer for %s, skipping installation.", m.name)
        elseif not module then
          m.install()
        end
    end

    local module = safeLoadModule(m.name, not m.ensure)
    if not module then
      printf("Skipping configuration for %s.", m.name)
      return
    elseif module and not m.configure then
      printf("No configurer for %s, skipping configuration.", m.name)
      return
    else
      m.configure(module)
    end
  end,

}
