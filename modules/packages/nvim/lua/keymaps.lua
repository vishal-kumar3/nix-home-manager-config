-- modules/nvim/lua/keymaps.lua
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Save and quit
map('n', '<leader>w', ':w<CR>', opts)
map('n', '<leader>q', ':q<CR>', opts)

-- Telescope
map('n', '<leader>ff', '<cmd>Telescope find_files<CR>', opts)
map('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', opts)
map('n', '<leader>fb', '<cmd>Telescope buffers<CR>', opts)

-- NvimTree
map('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', opts)

-- LSP
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

-- Format
map('n', '<leader>f', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
