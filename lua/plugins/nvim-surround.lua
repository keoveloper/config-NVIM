return {
	"kylechui/nvim-surround",
	version = "*",
	event = "VeryLazy",
	init = function()
		-- v4: keymaps are now controlled via global variables, not setup()
		vim.g.nvim_surround_no_mappings = true
	end,
	config = function()
		require("nvim-surround").setup()
		-- Custom keymaps via <Plug> values (v4 API)
		vim.keymap.set("n", "ds", "<Plug>(nvim-surround-delete)", { desc = "Delete surrounding pair" })
		vim.keymap.set("n", "cs", "<Plug>(nvim-surround-change)", { desc = "Change surrounding pair" })
		vim.keymap.set("x", "s", "<Plug>(nvim-surround-visual)", { desc = "Add surrounding pair (visual)" })
	end,
}
