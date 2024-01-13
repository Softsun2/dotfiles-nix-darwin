

local Ss2 = {}

-- standard format string print function, prepended with "[SS2]:"
Ss2.printf = function (formatString, ...)
    print(string.format("[SS2]: " .. formatString, ...))
end

-- load a module without propogating exception if it fails to load
Ss2.safeLoadModule = function (mName, printWarning)
    if printWarning == nil then
        printWarning = true
    end
    if not mName then
      error("No module specified.")
    end
    local success, module = pcall(require, mName)
    if not success and printWarning then
      print(module)
    end
    return success and module or nil
end

-- naively determines if nix is installed
Ss2.isNixUser = function ()
    return os.getenv("NIX_PATH") ~= nil
end

-- normal mode keymap
Ss2.nKeymap = function (key, map)
    vim.keymap.set("n", key, map, {noremap = true})
end

-- insert mode keymap
Ss2.iKeymap = function (key, map)
    vim.keymap.set("i", key, map, {noremap = true})
end

-- naively convert unix relative paths to windows relative paths
Ss2.unixToWinPath = function (unixPath)
    return string.gsub(unixPath, "/", "\\")
end

-- use a module, takes a table `m` expecting the keys:
-- name: the modules require name
-- ensure: print a warning if module is not found
-- configure: a function that configures the module if possible
Ss2.useModule = function (m)
    if not m.name then
        error("No module specified.")
    end
    local module = Ss2.safeLoadModule(m.name, m.required)
    if module and m.configure then
        m.configure(module)
    end
end

return Ss2
