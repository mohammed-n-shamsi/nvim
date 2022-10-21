local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Assignment operator shortcut
map('i', '<M-->', ' <- ', opts)

-- Pipe shortcut
map('i', '<M-m>', ' |> ', opts)
