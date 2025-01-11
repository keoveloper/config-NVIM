local keymap = vim.keymap
local opts = { noremap = true, silent = true }

--============================== Mode normal =============================
-- Do things without affecting the registers
keymap.set("n", "x", '"_x')

-- File explorer right
-- keymap.set("n", "<Leader>e", ":Neotree filesystem reveal right toggle<CR>")

-- Increment/decrement
-- keymap.set("n", "+", "<C-a>")
-- keymap.set("n", "-", "<C-x>")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

keymap.set("n", "<Leader>q", ":quit<Return>", opts)

-- Disable continuations
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- New tab
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<Tab>", ":tabnext<Return>", opts)

-- Split window
keymap.set("n", "sv", ":split<Return>", opts)
keymap.set("n", "ss", ":vsplit<Return>", opts)
-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window (not working right)
-- keymap.set("n", "<C><left>", "<C-w><")
-- keymap.set("n", "<C><right>", "<C-w>>")
-- keymap.set("n", "<C><up>", "<C-w>+")
-- keymap.set("n", "<C><down>", "<C-w>-")
keymap.set("n", "<C-z>", ":set wrap!<CR>", { noremap = true, silent = true })

--============================== Mode insert =============================

-- Delete word before
keymap.set("i", "<C-h>", "<C-o>db", opts)
-- Delete word after
keymap.set("i", "<C-l>", "<C-o>dw", opts)

-- Insertar un renglón abajo y volver
keymap.set("i", "<C-j>", "<Esc>o", opts)

-- Insertar un renglón arriba y volver
keymap.set("i", "<C-k>", "<Esc>O", opts)

-- Diagnostics
keymap.set("n", "<C-j>", function()
	vim.diagnostic.goto_next()
end, opts)

--======= save and run code (need RunCode plugin) ==========
keymap.set("i", "<C-r>", "<Esc>:w<CR>:RunCode<CR>a", opts) --
--==========================================================

--=disable the default keymaps for the LSP=

-- keymap.set("n", "a", "<Nop>", opts) --     =
-- keymap.set("n", "e", "<Nop>", opts) --     =
-- keymap.set("n", "s", "<Nop>", opts) --     =
-- keymap.set("n", "f", "<Nop>", opts) --     =
-- keymap.set("n", ".", "<Nop>", opts) --     =
-- keymap.set("n", ",", "<Nop>", opts) --     =
--==========================================
