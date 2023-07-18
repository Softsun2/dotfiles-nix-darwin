-- start flavours
require('base16-colorscheme').setup({
    base00 = '#191724', base01 = '#1f1d2e', base02 = '#26233a', base03 = '#6e6a86',
    base04 = '#908caa', base05 = '#e0def4', base06 = '#e0def4', base07 = '#524f67',
    base08 = '#eb6f92', base09 = '#f6c177', base0A = '#ebbcba', base0B = '#31748f',
    base0C = '#9ccfd8', base0D = '#c4a7e7', base0E = '#f6c177', base0F = '#524f67',
})
-- end flavours

vim.o.background = false
-- require('rose-pine').setup({
-- 	--- @usage 'auto'|'main'|'moon'|'dawn'
-- 	variant = 'main',
-- 	--- @usage 'main'|'moon'|'dawn'
-- 	dark_variant = 'main',
-- 	bold_vert_split = false,
-- 	dim_nc_background = false,
-- 	disable_background = true,
-- 	disable_float_background = false,
-- 	disable_italics = false,
-- 
-- 	--- @usage string hex value or named color from rosepinetheme.com/palette
-- 	groups = {
-- 		background = 'base',
-- 		background_nc = '_experimental_nc',
-- 		panel = 'surface',
-- 		panel_nc = 'base',
-- 		border = 'highlight_med',
-- 		comment = 'muted',
-- 		link = 'iris',
-- 		punctuation = 'subtle',
-- 
-- 		error = 'love',
-- 		hint = 'iris',
-- 		info = 'foam',
-- 		warn = 'gold',
-- 
-- 		headings = {
-- 			h1 = 'iris',
-- 			h2 = 'foam',
-- 			h3 = 'rose',
-- 			h4 = 'gold',
-- 			h5 = 'pine',
-- 			h6 = 'foam',
-- 		}
-- 		-- or set all headings at once
-- 		-- headings = 'subtle'
-- 	},
-- 
-- 	-- Change specific vim highlight groups
-- 	-- https://github.com/rose-pine/neovim/wiki/Recipes
-- 	highlight_groups = {
-- 		ColorColumn = { bg = 'rose' },
-- 
-- 		-- Blend colours against the "base" background
-- 		CursorLine = { bg = 'foam', blend = 10 },
-- 		StatusLine = { fg = 'love', bg = 'love', blend = 10 },
-- 	}
-- })
-- 
-- -- Set colorscheme after options
-- vim.cmd('colorscheme rose-pine')
