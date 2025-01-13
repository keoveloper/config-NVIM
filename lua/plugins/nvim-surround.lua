return {
	"kylechui/nvim-surround",
	version = "*", -- Use for stability; omit to use `main` branch for the latest features
	event = "VeryLazy",
	config = function()
		require("nvim-surround").setup({
			-- Configuration here, or leave empty to use defaults
			keymaps = {
				insert = false, -- Desactiva <C-g>s
				insert_line = false, -- Desactiva <C-g>S
				normal = false, -- Mantiene `ys` en modo normal
				normal_line = false, -- Desactiva `yss`
				normal_cur = false, -- Desactiva `yss`
				normal_cur_line = false,
				visual = "s", -- Desactiva `S` en modo visual
				visual_line = false, -- Desactiva `gS` en modo visual
				delete = "ds", -- Mantiene `ds` para borrar delimitadores
				change = "cs", -- Mantiene `cs` para cambiar delimitadores
			},
		})
	end,
}
