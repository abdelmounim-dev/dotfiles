# Neovim Setup Summary

This document provides a summary of the Neovim configuration found in `init.lua` and the `lua/plugins/` directory.

## Overall Structure

The configuration uses `lazy.nvim` as the plugin manager. The main configuration is in `init.lua`, which sets up basic Neovim options and keymaps. It then loads all the plugin configurations from the `lua/plugins/` directory.

## Core Configuration (`init.lua`)

The `init.lua` file configures various editor settings, including:

*   **Leader Key:** `<space>`
*   **Line Numbers:** Enabled (relative numbers are also on).
*   **Clipboard:** Syncs with the OS clipboard.
*   **UI:** Sets up options for splits, whitespace characters, and statusline.
*   **Keymaps:**
    *   Diagnostic navigation (`[d`, `]d`, `<leader>e`, `<leader>q`).
    *   Window navigation (`<C-h/j/k/l>`).
    *   Telescope file browser (`<leader>fb`).
    *   Oil file manager (`<leader>oi`).

## Installed Plugins

Here is a list of the installed plugins and their functions:

### UI and Appearance

*   **`catppuccin/nvim`**: The colorscheme is set to Catppuccin.
*   **`folke/which-key.nvim`**: Shows pending keybinds.
*   **`echasnovski/mini.nvim`**: Provides several small UI enhancements, including improved text objects, surrounding text, and a status line.
*   **`lukas-reineke/indent-blankline.nvim`**: Adds indentation guides.
*   **`nvim-neo-tree/neo-tree.nvim`**: A file explorer.
*   **`stevearc/oil.nvim`**: A file explorer that replaces netrw.
*   **`folke/snacks.nvim`**: Provides various UI enhancements.

### Development and LSP

*   **`neovim/nvim-lspconfig`**: The core LSP configuration plugin.
*   **`williamboman/mason.nvim`**: Manages LSP servers, DAP debuggers, linters, and formatters.
*   **`hrsh7th/nvim-cmp`**: Autocompletion plugin.
*   **`L3MON4D3/LuaSnip`**: Snippet engine.
*   **`stevearc/conform.nvim`**: Auto-formatting.
*   **`mfussenegger/nvim-lint`**: Linting.
*   **`nvim-treesitter/nvim-treesitter`**: Provides syntax highlighting and other language-aware features.
*   **`ray-x/go.nvim`**: Tools for Go development.
*   **`pmizio/typescript-tools.nvim`**: Tools for TypeScript development.

### Fuzzy Finding

*   **`nvim-telescope/telescope.nvim`**: A powerful fuzzy finder for files, LSP definitions, and more.
*   **`nvim-telescope/telescope-file-browser.nvim`**: A file browser extension for Telescope.

### Git Integration

*   **`lewis6991/gitsigns.nvim`**: Adds Git signs to the gutter and provides hunk management.

### Debugging

*   **`mfussenegger/nvim-dap`**: Debug Adapter Protocol support.
*   **`rcarriga/nvim-dap-ui`**: A UI for the debugger.

### Other

*   **`windwp/nvim-autopairs`**: Automatically closes pairs of brackets, quotes, etc.
*   **`numToStr/Comment.nvim`**: Easy commenting.
*   **`tpope/vim-sleuth`**: Automatically detects indentation settings.
*   **`zbirenbaum/copilot.lua`**: GitHub Copilot integration.
*   **`tpope/vim-dadbod`**: Database integration.
*   **`epwalsh/obsidian.nvim`**: Integration with the Obsidian note-taking app.
*   **`folke/todo-comments.nvim`**: Highlights TODO comments.
