local printf = function (formatString, ...)
  print(string.format(formatString, ...))
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

  bootstrapModule = function (m)
    if not m.name then
      error("No module specified.")
    end

    local installed, _ = pcall(require, m.name)
    if not installed and not m.install then
      printf("No installer for %s, skipping installation.", m.name)
      return
    elseif not installed then
      m.install()
    end

    installed, module = pcall(require, m.name)
    if not installed then
      printf("Installation of %s failed, skipping configuration.", m.name)
      return
    elseif installed and not m.configure then
      printf("No configurer for %s, skipping configuration.", m.name)
      return
    else
      m.configure(module)
    end

  end,

}
