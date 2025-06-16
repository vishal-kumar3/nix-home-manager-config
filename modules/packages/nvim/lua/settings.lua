-- modules/nvim/lua/settings.lua
vim.o.number = true           -- Line numbers
vim.o.relativenumber = true   -- Relative line numbers
vim.o.tabstop = 2             -- 2 spaces for tabs
vim.o.shiftwidth = 2          -- 2 spaces for indent
vim.o.expandtab = true        -- Use spaces instead of tabs
vim.o.smartindent = true      -- Smart indenting
vim.o.wrap = false            -- No line wrap
vim.o.termguicolors = true    -- True color support
vim.o.updatetime = 300        -- Faster updates
vim.o.mouse = 'a'             -- Enable mouse
vim.o.clipboard = 'unnamedplus' -- System clipboard
vim.o.cursorline = true       -- Highlight current line

-- Set leader key
vim.g.mapleader = ' '
