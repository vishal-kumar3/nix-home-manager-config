local M = {}

M.ui = {
  theme = "gruvbox",
  theme_toggle = { "gruvbox", "one_light" },

  -- Transparency
  transparency = true,

  -- NvDash (dashboard)
  nvdash = {
    load_on_startup = true,
  },

  -- Statusline
  statusline = {
    theme = "vscode_colored",
    separator_style = "round",
  },

  -- Tabufline
  tabufline = {
    show_numbers = true,
    enabled = true,
    lazyload = true,
  },

  -- Telescope
  telescope = {
    style = "borderless",
  },

  -- LSP
  lsp = {
    signature = true,
  },
}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
