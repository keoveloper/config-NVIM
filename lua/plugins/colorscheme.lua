-- Cambia este valor para elegir tu tema actual
local active_theme = "bluloco"
-- local active_theme = "catppuccin"
-- local active_theme = "onedark"

return {
	require("plugins.themes." .. active_theme),
}
