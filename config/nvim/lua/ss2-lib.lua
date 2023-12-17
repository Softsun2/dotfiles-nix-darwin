-- hoist util so they can be used in the module
local printf = function (formatString, ...)
  print(string.format(formatString, ...))
end
local safeLoadModule = function (mName)
  if not mName then
    error("No module specified.")
  end
  local success, module = pcall(require, mName)
  if success then
    return module
  else
    printf("Module %s failed to load.\n%s", mName, module)
    return nil
  end
end

return {

  -- returns whether packer is installed with nix or not
  installedWithNix = function ()
    return false
  end,

  -- naive, for relative paths only
  unixToWin64Path = function (unixPath)
    return string.gsub(unixPath, "/", "\\")
  end,

  printf = printf,
  safeLoadModule = safeLoadModule,

  -- TODO: parse for module dependencies
  bootstrapModule = function (m)
    if not m.name then
      error("No module specified.")
    end

    local module = safeLoadModule(m.name)
    if not module and not m.install then
      printf("No installer for %s, skipping installation.", m.name)
      return
    elseif not module then
      m.install()
    end

    local module = safeLoadModule(m.name)
    if not module then
      printf("Installation of %s failed, skipping configuration.", m.name)
      return
    elseif module and not m.configure then
      printf("No configurer for %s, skipping configuration.", m.name)
      return
    else
      m.configure(module)
    end

  end,

}
