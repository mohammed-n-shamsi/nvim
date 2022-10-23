local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '


-- Move to previous/next
map('n', '<leader>,', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<leader>.', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<leader><', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<leader>>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<leader>1', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<leader>2', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<leader>3', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<leader>4', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<leader>5', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<leader>6', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<leader>7', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<leader>8', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<leader>9', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<leader>0', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
map('n', '<leader>p', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<leader>w', '<Cmd>BufferClose<CR>', opts)
-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

--  Telescope mappings
map('n', '<C-p>', '<Cmd>Telescope find_files<CR>', opts)
map('n', '<S-p>', '<Cmd>Telescope live_grep<CR>', opts)
map('n', '<C-b>', '<Cmd>Telescope buffers<CR>', opts)
map('n', '<C-h>', '<Cmd>Telescope help_tags<CR>', opts)

-- Iron mappings
map('n', '<leader>st', '<Cmd>IronRepl<CR>', opts)

-- SINNING SAVE
map('n', '<C-s>', ':w<CR>', opts)
map('i', '<C-s>', '<Esc>:w<CR>a', opts)

-- Clang swap source header
-- map('n', 'gh', '<Cmd>ClangdSwitchSourceHeader<CR>', opts)

-- Trouble mappings
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "gr", "<cmd>TroubleToggle lsp_references<cr>",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "gd", "<cmd>TroubleToggle lsp_definitions<cr>",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "gy", "<cmd>TroubleToggle lsp_type_definitions<cr>",
    { silent = true, noremap = true }
)

-- LSP Saga mappings

vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>",
    { silent = true, noremap = true }
)

vim.keymap.set("n", "go", "<cmd>LSoutlineToggle<CR>",
    { silent = true, noremap = true }
)

vim.keymap.set("n", "gk", "<cmd>RustHoverActions<CR>",
    { silent = true, noremap = true }
)


-- Todo Comments Mappings
vim.keymap.set("n", "]t", function()
    require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
    require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })
