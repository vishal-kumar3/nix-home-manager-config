local M = {}

M.general = {
  n = {
    -- Save and quit
    ["<leader>w"] = { "<cmd>w<CR>", "Save file" },
    ["<leader>q"] = { "<cmd>q<CR>", "Quit" },
    ["<C-s>"] = { "<cmd>w<CR>", "Save file" },

    -- Navigate buffers
    ["<S-l>"] = { "<cmd>BufferLineCycleNext<CR>", "Next buffer" },
    ["<S-h>"] = { "<cmd>BufferLineCyclePrev<CR>", "Previous buffer" },

    -- Clear search highlighting
    ["<leader>h"] = { "<cmd>nohl<CR>", "Clear highlights" },

    -- Split navigation
    ["<C-h>"] = { "<C-w>h", "Move to left split" },
    ["<C-j>"] = { "<C-w>j", "Move to bottom split" },
    ["<C-k>"] = { "<C-w>k", "Move to top split" },
    ["<C-l>"] = { "<C-w>l", "Move to right split" },

    -- Split management
    ["<leader>sv"] = { "<cmd>vsplit<CR>", "Vertical split" },
    ["<leader>sh"] = { "<cmd>split<CR>", "Horizontal split" },
    ["<leader>sc"] = { "<cmd>close<CR>", "Close split" },
  },

  i = {
    ["<C-s>"] = { "<cmd>w<CR>", "Save file" },
  },

  v = {
    ["<"] = { "<gv", "Indent left" },
    [">"] = { ">gv", "Indent right" },
  },
}

-- Go-specific mappings
M.go = {
  n = {
    ["<leader>gr"] = { "<cmd>GoRun<CR>", "Go run" },
    ["<leader>gb"] = { "<cmd>GoBuild<CR>", "Go build" },
    ["<leader>gt"] = { "<cmd>GoTest<CR>", "Go test" },
    ["<leader>gtf"] = { "<cmd>GoTestFunc<CR>", "Go test function" },
    ["<leader>gc"] = { "<cmd>GoCoverage<CR>", "Go coverage" },
    ["<leader>gf"] = { "<cmd>GoFmt<CR>", "Go format" },
    ["<leader>gi"] = { "<cmd>GoImport<CR>", "Go import" },
    ["<leader>gd"] = { "<cmd>GoDoc<CR>", "Go doc" },
  },
}

-- LSP mappings
M.lsp = {
  n = {
    ["gD"] = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "LSP declaration" },
    ["gd"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "LSP definition" },
    ["K"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "LSP hover" },
    ["gi"] = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "LSP implementation" },
    ["<leader>D"] = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "LSP definition type" },
    ["<leader>ra"] = { "<cmd>lua vim.lsp.buf.rename()<CR>", "LSP rename" },
    ["<leader>ca"] = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "LSP code action" },
    ["gr"] = { "<cmd>lua vim.lsp.buf.references()<CR>", "LSP references" },
    ["<leader>e"] = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Floating diagnostic" },
    ["[d"] = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Goto prev" },
    ["]d"] = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Goto next" },
    ["<leader>fm"] = { "<cmd>lua vim.lsp.buf.format { async = true }<CR>", "LSP formatting" },
  },
}

-- Telescope mappings
M.telescope = {
  n = {
    ["<leader>ff"] = { "<cmd>Telescope find_files<CR>", "Find files" },
    ["<leader>fg"] = { "<cmd>Telescope live_grep<CR>", "Live grep" },
    ["<leader>fb"] = { "<cmd>Telescope buffers<CR>", "Find buffers" },
    ["<leader>fh"] = { "<cmd>Telescope help_tags<CR>", "Help tags" },
    ["<leader>fo"] = { "<cmd>Telescope oldfiles<CR>", "Find old files" },
    ["<leader>fz"] = { "<cmd>Telescope current_buffer_fuzzy_find<CR>", "Find in current buffer" },
    ["<leader>cm"] = { "<cmd>Telescope git_commits<CR>", "Git commits" },
    ["<leader>gt"] = { "<cmd>Telescope git_status<CR>", "Git status" },
  },
}

return M
