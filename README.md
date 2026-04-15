# Alan's Dotfiles

NeoVim configuration for TypeScript, Go, and Python development.


## Installation

    brew install neovim
    ./install.sh

On first launch, [lazy.nvim](https://github.com/folke/lazy.nvim) will auto-bootstrap and install all plugins. Then install the LSP servers and linters:

    :MasonInstall ruff eslint golangci-lint


## Key Features

* [Solarized Dark](https://github.com/maxmx03/solarized.nvim) color scheme with transparent background
* Buffer tabs at the top via [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
* LSP support for TypeScript, Go, and Python via [mason](https://github.com/mason-org/mason.nvim) + [lspconfig](https://github.com/neovim/nvim-lspconfig)
* Async linting while you type via [nvim-lint](https://github.com/mfussenegger/nvim-lint) (ruff, eslint, golangci-lint)
* Autocompletion with Tab via [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
* [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) for syntax highlighting
* Common swp, backup, & view directories (no more ~ files left around)
* Useful defaults (spaces instead of tabs, remove trailing whitespace, etc.)


## Plugins

* [solarized.nvim](https://github.com/maxmx03/solarized.nvim) - Solarized Dark color scheme
* [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) - Buffer tabs with LSP diagnostics
* [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - Statusline with powerline fonts
* [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) - File tree explorer
* [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy file finder
* [CamelCaseMotion](https://github.com/bkad/CamelCaseMotion) - CamelCase motion through words (`,w` `,b` `,e`)
* [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - LSP configs for ts_ls, gopls, pyright
* [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Autocompletion engine
* [nvim-lint](https://github.com/mfussenegger/nvim-lint) - Async linting (ruff, eslint, golangci-lint)
* [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - Git status in the gutter
* [nvim-surround](https://github.com/kylechui/nvim-surround) - Quoting/parenthesizing made simple
* [vim-go](https://github.com/fatih/vim-go) - Go development plugin
* [vim-wakatime](https://github.com/wakatime/vim-wakatime) - Automatic time tracking


## Key Bindings

| Key | Action |
|---|---|
| `Ctrl-f` | Fuzzy file finder (telescope) |
| `Ctrl-t` | Toggle file tree |
| `Ctrl-g` | Go to definition (LSP) |
| `Ctrl-n` / `Ctrl-p` | Next / previous buffer tab |
| `Ctrl-d` | Close current buffer |
| `Ctrl-h/j/k/l` | Navigate between split windows |
| `K` | Hover documentation (LSP) |
| `gr` | Find references (LSP) |
| `\rn` | Rename symbol (LSP) |
| `\ca` | Code actions (LSP) |
| `[d` / `]d` | Previous / next diagnostic |
| `,w` `,b` `,e` | CamelCase word motions |
| `Space` | Open fold and center line |
| `f0`-`f9` | Set fold level |


## Font and Color Theme

### Use a font patched for powerline compatibility, like [Anonymous Pro](https://github.com/powerline/fonts/raw/master/AnonymousPro/Anonymice%20Powerline.ttf):

[Full list of fonts](https://github.com/powerline/fonts)

### Install the solarized color palette in your terminal:

[iTerm2](https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized):

* Open iTerm 2, open Preferences, click on the "Profiles" icon in the preferences toolbar, then select the "colors" tab.
* Click on the "load presets" and select "import...".
* Select the Solarized Dark theme file.

More info on the official [Solarized page](https://github.com/altercation/solarized#features).
