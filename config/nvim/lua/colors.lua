-- start flavours
require('base16-colorscheme').setup({
    base00 = '#000000', base01 = '#303030', base02 = '#505050', base03 = '#b0b0b0',
    base04 = '#d0d0d0', base05 = '#e0e0e0', base06 = '#f5f5f5', base07 = '#ffffff',
    base08 = '#fb0120', base09 = '#fc6d24', base0A = '#fda331', base0B = '#a1c659',
    base0C = '#76c7b7', base0D = '#6fb3d2', base0E = '#d381c3', base0F = '#be643c',
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
