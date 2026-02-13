return {
	"tiagovla/tokyodark.nvim",
	opts = {
		transparent_background = false,
		gamma = 1.00,
		styles = {
			comments = { italic = true },
			keywords = { italic = true },
			identifiers = { italic = true },
			functions = {},
			variables = {},
		},
		custom_highlights = function(highlights, palette)
			return {
				-- Cambia el color del modo Visual
				Visual = { bg = "#575799" }, -- Cambia este color hex al que quieras

				-- O puedes usar los colores de la paleta de tokyodark:
				-- Visual = { bg = palette.bg3 },
				-- Visual = { bg = palette.blue },
				-- Visual = { bg = palette.purple },
			}
		end,
		custom_palette = {} or function(palette)
			return {}
		end,
		terminal_colors = true,
	},
	config = function(_, opts)
		require("tokyodark").setup(opts)
		vim.cmd([[colorscheme tokyodark]])
	end,
}
