return {
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		opts = function(_, opts)
			opts.transparent = true
			opts.italic_comments = true
			opts.borderless_telescope = false
		end,
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "cyberdream",
		},
	},

	-- modicator (auto color line number based on vim mode)
	{
		"mawkler/modicator.nvim",
		dependencies = "scottmckendry/cyberdream.nvim",
		init = function()
			-- These are required for Modicator to work
			vim.o.cursorline = false
			vim.o.number = true
			vim.o.termguicolors = true
		end,
		opts = {},
	},
}

-- return {
-- 	{
-- 		"folke/tokyonight.nvim",
-- 		lazy = false,
-- 		priority = 1000,
-- 		opts = {},
-- 		vim.cmd.colorscheme("tokyonight"),
-- 	},
-- }

-- return {
-- 	{
-- 		"sainnhe/sonokai",
-- 		priority = 1000,
-- 		config = function()
-- 			vim.g.sonokai_transparent_background = "1"
-- 			vim.g.sonokai_enable_italic = "1"
-- 			vim.g.sonokai_style = "andromeda"
-- 			vim.cmd.colorscheme("sonokai")
-- 		end,
-- 	},
-- }

-- return {
-- 	{
-- 		"craftzdog/solarized-osaka.nvim",
-- 		lazy = true,
-- 		priority = 1000,
-- 		opts = function()
-- 			return {
-- 				transparent = true,
-- 			}
-- 		end,
-- 	},
-- }
