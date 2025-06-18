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
    ["<leader>gtF"] = { "<cmd>GoTestFile<CR>", "Go test file" },
    ["<leader>gta"] = { "<cmd>GoAddTest<CR>", "Go add test" },
    ["<leader>gc"] = { "<cmd>GoCoverage<CR>", "Go coverage" },
    ["<leader>gf"] = { "<cmd>GoFmt<CR>", "Go format" },
    ["<leader>gi"] = { "<cmd>GoImport<CR>", "Go import" },
    ["<leader>gd"] = { "<cmd>GoDoc<CR>", "Go doc" },
    ["<leader>gv"] = { "<cmd>GoVet<CR>", "Go vet" },
    ["<leader>gl"] = { "<cmd>GoLint<CR>", "Go lint" },
    ["<leader>gfs"] = { "<cmd>GoFillStruct<CR>", "Go fill struct" },
    ["<leader>gie"] = { "<cmd>GoIfErr<CR>", "Go if err" },
    ["<leader>gtj"] = { "<cmd>GoAddTag json<CR>", "Add json tags" },
    ["<leader>gty"] = { "<cmd>GoAddTag yaml<CR>", "Add yaml tags" },
    ["<leader>gtr"] = { "<cmd>GoRmTag<CR>", "Remove tags" },
    ["<leader>gim"] = { "<cmd>GoImpl<CR>", "Go implement interface" },
    ["<leader>gch"] = { "<cmd>GoCmt<CR>", "Go comment" },
  },
}

-- DAP (Debug Adapter Protocol) mappings
M.dap = {
  n = {
    ["<leader>db"] = { "<cmd>DapToggleBreakpoint<CR>", "Toggle breakpoint" },
    ["<leader>dc"] = { "<cmd>DapContinue<CR>", "Continue" },
    ["<leader>di"] = { "<cmd>DapStepInto<CR>", "Step into" },
    ["<leader>do"] = { "<cmd>DapStepOver<CR>", "Step over" },
    ["<leader>du"] = { "<cmd>DapStepOut<CR>", "Step out" },
    ["<leader>dr"] = { "<cmd>DapRepl<CR>", "Open REPL" },
    ["<leader>dt"] = { "<cmd>DapTerminate<CR>", "Terminate" },
    ["<leader>dui"] = { "<cmd>lua require('dapui').toggle()<CR>", "Toggle DAP UI" },
  },
}

-- Database mappings
M.database = {
  n = {
    ["<leader>Du"] = { "<cmd>DBUIToggle<CR>", "Toggle DB UI" },
    ["<leader>Df"] = { "<cmd>DBUIFindBuffer<CR>", "Find DB buffer" },
    ["<leader>Dr"] = { "<cmd>DBUIRenameBuffer<CR>", "Rename DB buffer" },
    ["<leader>Dl"] = { "<cmd>DBUILastQueryInfo<CR>", "Last query info" },
  },
}

-- REST client mappings
M.rest = {
  n = {
    ["<leader>rr"] = { "<cmd>Rest run<CR>", "Run request" },
    ["<leader>rl"] = { "<cmd>Rest run last<CR>", "Run last request" },
    ["<leader>rp"] = { "<cmd>Rest run preview<CR>", "Preview request" },
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
