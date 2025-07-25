return {
	"yetone/avante.nvim",
	-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
	-- ⚠️ must add this setting! ! !
	build = vim.fn.has("win32") and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
		or "make",
	event = "VeryLazy",
	version = false, -- Never set this value to "*"! Never!
	---@module 'avante'
	---@type avante.Config
	opts = {
		-- add any opts here
		-- for example
		providers = {
			copilot = {
				model = "gpt-4", -- o1-preview | o1-mini | claude-3.7-sonnet
			},
			-- Si algún día metes Claude u otro, aquí iría también
			-- claude = { model = "claude-3.7-sonnet" }
		},
		provider = "copilot", -- Recommend using Claude
		cursor_applying_provider = "copilot", -- In this example, use Groq for applying, but you can also use any provider you want.
		auto_suggestions_provider = "copilot", -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilot
		behaviour = {
			auto_suggestions = true, -- Experimental stage
			auto_set_highlight_group = true,
			auto_set_keymaps = true,
			auto_apply_diff_after_generation = false,
			support_paste_from_clipboard = false,
			enable_cursor_planning_mode = true, -- enable cursor planning mode!
		}, -- provider = "claude",
		-- providers = {
		-- 	claude = {
		-- 		endpoint = "https://api.anthropic.com",
		-- 		model = "claude-sonnet-4-20250514",
		-- 		timeout = 30000, -- Timeout in milliseconds
		-- 		extra_request_body = {
		-- 			temperature = 0.75,
		-- 			max_tokens = 20480,
		-- 		},
		-- 	},
		-- 	moonshot = {
		-- 		endpoint = "https://api.moonshot.ai/v1",
		-- 		model = "kimi-k2-0711-preview",
		-- 		timeout = 30000, -- Timeout in milliseconds
		-- 		extra_request_body = {
		-- 			temperature = 0.75,
		-- 			max_tokens = 32768,
		-- 		},
		-- 	},
		-- },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- The below dependencies are optional,
		"echasnovski/mini.pick", -- for file_selector provider mini.pick
		-- "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
		-- "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
		-- "ibhagwan/fzf-lua", -- for file_selector provider fzf
		"stevearc/dressing.nvim", -- for input provider dressing
		-- "folke/snacks.nvim", -- for input provider snacks
		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
		-- "zbirenbaum/copilot.lua", -- for providers='copilot'
		{
			-- support for image pasting
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				-- recommended settings
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
					-- required for Windows users
					use_absolute_path = true,
				},
			},
		},
		{
			-- Make sure to set this up properly if you have lazy=true
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}
