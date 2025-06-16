{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      telescope-nvim # Fuzzy finder
      nvim-lspconfig # Language server support
      {
        plugin = nvim-treesitter;
        config = ''
          lua << EOF
          require('nvim-treesitter.configs').setup {
            highlight = { enable = true },
            ensure_installed = { "javascript", "typescript", "go" },
          }
          EOF
        '';
      }
    ];
    extraConfig = ''
      lua << EOF
      -- Setup LSP for Go and Node.js
      require('lspconfig').gopls.setup{}
      require('lspconfig').tsserver.setup{}
      -- Telescope keybindings
      vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true })
      vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<CR>', { noremap = true })
      EOF
    '';
  };
}
