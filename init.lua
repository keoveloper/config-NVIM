if vim.loader then
	vim.loader.enable()
end

_G.dd = function(...)
	require("util.debug").dump(...)
end
vim.print = _G.dd

require("config.lazy")

-- require("config.blink")

require("code_runner").setup({
	filetype = {
		java = {
			"cd $dir &&",
			"javac $fileName &&",
			"java $fileNameWithoutExt",
		},
		python = "python3 -u",
		typescript = "deno run",
		rust = {
			"cd $dir &&",
			"rustc $fileName &&",
			"$dir/$fileNameWithoutExt",
		},
		c = function(...)
			c_base = {
				"cd $dir &&",
				"gcc $fileName -o",
				"/tmp/$fileNameWithoutExt",
			}
			local c_exec = {
				"&& /tmp/$fileNameWithoutExt &&",
				"rm /tmp/$fileNameWithoutExt",
			}
			vim.ui.input({ prompt = "Add more args:" }, function(input)
				c_base[4] = input
				vim.print(vim.tbl_extend("force", c_base, c_exec))
				require("code_runner.commands").run_from_fn(vim.list_extend(c_base, c_exec))
			end)
		end,
	},
})
