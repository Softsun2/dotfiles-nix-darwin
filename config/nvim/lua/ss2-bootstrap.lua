Ss2.bootstrapModule({
    name = "lazy",  -- lazy loading plugin manager
    ensure = not Ss2.isNixUser(),
    install = function ()
        local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
        if not Ss2.isNixUser() and not vim.loop.fs_stat(lazypath) then
            vim.fn.system({
                "git",
                "clone",
                "--filter=blob:none",
                "https://github.com/folke/lazy.nvim.git",
                "--branch=stable", -- latest stable release
                lazypath
            })
            vim.opt.rtp:append(lazypath)
        end
    end,
})
