--
-- NeoVim Configuration
--   Author: Alan Hamlett
--   Migrated from Vim/Vundle to NeoVim/lazy.nvim
--

-- Suppress deprecation warnings from plugins not yet updated for NeoVim 0.12
vim.deprecate = function() end

-- ============================================================================
-- General Settings
-- ============================================================================

vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

vim.opt.mouse = ""
vim.opt.encoding = "utf-8"
vim.opt.showcmd = true
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.backspace = "indent,eol,start"
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 4
vim.opt.autoindent = true
vim.opt.number = true
vim.opt.showmatch = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wildmenu = true
vim.opt.wildmode = "list:longest,full"
vim.opt.scrolloff = 2
vim.opt.laststatus = 2
vim.opt.ruler = true
vim.opt.wrap = false
vim.opt.synmaxcol = 900
vim.opt.fileformats = "unix,mac,dos"
vim.opt.colorcolumn = "80"
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 300

-- Diagnostics: virtual text while editing, location list on save
vim.diagnostic.config({
  virtual_text = {
    spacing = 4,
    prefix = "●",
    format = function(d)
      if d.code then
        return string.format("[%s] %s", d.code, d.message)
      end
      return d.message
    end,
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  float = {
    format = function(d)
      if d.code then
        return string.format("[%s] %s", d.code, d.message)
      end
      return d.message
    end,
  },
})
vim.api.nvim_create_autocmd("BufWritePost", {
  callback = function()
    -- Wait briefly for diagnostics to update after save
    vim.defer_fn(function()
      local diagnostics = vim.diagnostic.get(0)
      if #diagnostics > 0 then
        vim.diagnostic.setloclist({ open = false })
        vim.cmd("silent! lopen")
        vim.cmd("wincmd p") -- return focus to the file
      else
        vim.cmd("silent! lclose")
      end
    end, 500)
  end,
})

-- Folding
vim.opt.foldenable = true
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 0
vim.opt.foldopen = "block,hor,mark,percent,quickfix,tag"

-- Backup, swap, views
vim.fn.mkdir(vim.fn.expand("~/.vim/.backups"), "p")
vim.fn.mkdir(vim.fn.expand("~/.vim/.swaps"), "p")
vim.fn.mkdir(vim.fn.expand("~/.vim/.views"), "p")
vim.opt.backup = true
vim.opt.backupdir = vim.fn.expand("~/.vim/.backups/")
vim.opt.directory = vim.fn.expand("~/.vim/.swaps/")
vim.opt.viewdir = vim.fn.expand("~/.vim/.views/")

-- ============================================================================
-- Filetype-specific settings
-- ============================================================================

vim.api.nvim_create_autocmd("FileType", {
  pattern = "javascript",
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.foldmethod = "marker"
    vim.opt_local.cindent = false
    vim.opt_local.smartindent = true
    vim.opt_local.colorcolumn = "160"
    vim.opt_local.iskeyword:append("$")
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "typescript",
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.colorcolumn = "160"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "typescriptreact",
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.colorcolumn = "160"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.colorcolumn = "160"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.expandtab = false
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "html", "htmldjango", "css", "less", "scss" },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.cindent = false
    vim.opt_local.smartindent = true
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "ruby",
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.colorcolumn = "100"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "perl",
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.foldmethod = "marker"
    vim.opt_local.iskeyword:append("@-@,$,%")
  end,
})

-- Strip trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local pos = vim.api.nvim_win_get_cursor(0)
    vim.cmd([[silent! %s/\s\+$//e]])
    vim.api.nvim_win_set_cursor(0, pos)
  end,
})

-- Restore cursor position when reopening files
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    if mark[1] > 0 and mark[1] <= vim.api.nvim_buf_line_count(0) then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})

-- Highlight tabs as errors in non-Go files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    if vim.bo.filetype ~= "go" then
      vim.fn.matchadd("Error", "\\s*\\t\\+")
    end
  end,
})

-- ============================================================================
-- Key Mappings
-- ============================================================================

local map = vim.keymap.set

-- Pressing v escapes from visual mode
map("v", "v", "<Esc>", { desc = "Exit visual mode" })

-- Space centers current line
map("n", "<Space>", "zvzz", { desc = "Open fold and center" })

-- Up/Down scroll one line
map("n", "<Up>", "<C-y>", { desc = "Scroll up" })
map("n", "<Down>", "<C-e>", { desc = "Scroll down" })

-- Left/Right move to prev/next fold
map("n", "<Left>", "zk", { desc = "Previous fold" })
map("n", "<Right>", "zj", { desc = "Next fold" })

-- Fold level shortcuts
for i = 0, 9 do
  map("n", "f" .. i, ":set foldlevel=" .. i .. "<CR>", { desc = "Set fold level " .. i })
end

-- Shift+Backspace = Backspace
map({ "n", "i" }, "<S-BS>", "<BS>")
map({ "n", "i" }, "<Del>", "<BS>")
map({ "n", "i" }, "<S-Del>", "<BS>")

-- Window navigation with Ctrl+h/j/k/l
map("n", "<C-h>", "<C-w>h", { desc = "Window left" })
map("n", "<C-j>", "<C-w>j", { desc = "Window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window up" })
map("n", "<C-l>", "<C-w>l", { desc = "Window right" })

-- Fix syntax highlighting
map("n", "<C-s>", ":syntax sync fromstart<CR>", { desc = "Resync syntax" })

-- ============================================================================
-- Plugin Manager (lazy.nvim)
-- ============================================================================

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ============================================================================
-- Plugins
-- ============================================================================

require("lazy").setup({

  -- Color scheme
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        transparent = true,
        commentStyle = { italic = true },
        keywordStyle = { italic = true },
      })
      vim.cmd.colorscheme("kanagawa")
    end,
  },

  -- CamelCase motion (use , as motion leader: ,w ,b ,e ,ge)
  {
    "bkad/CamelCaseMotion",
    init = function()
      vim.g.camelcasemotion_key = ","
    end,
  },

  -- Buffer tabs at top
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers",
          numbers = "ordinal",
          diagnostics = "nvim_lsp",
          show_buffer_icons = false,
          show_buffer_close_icons = false,
          show_close_icon = false,
          separator_style = "thin",
          custom_filter = function(buf)
            return vim.bo[buf].buflisted and vim.bo[buf].buftype ~= "quickfix"
          end,
        },
      })
      -- Buffer navigation (matching your Ctrl-n/p/d mappings)
      map("n", "<C-n>", ":BufferLineCycleNext<CR>", { silent = true, desc = "Next buffer" })
      map("n", "<C-p>", ":BufferLineCyclePrev<CR>", { silent = true, desc = "Previous buffer" })
      map("n", "<C-d>", ":bdelete<CR>", { silent = true, desc = "Delete buffer" })
      -- Jump to buffer by number with \1 through \9
      for i = 1, 9 do
        map("n", "<leader>" .. i, function()
          require("bufferline").go_to(i, true)
        end, { silent = true, desc = "Go to buffer " .. i })
      end
    end,
  },

  -- Statusline (replaces vim-airline)
  {
    "nvim-lualine/lualine.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto",
        },
      })
    end,
  },

  -- File explorer (replaces NERDTree)
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-tree").setup({
        view = { width = 30 },
      })
      map("n", "<C-t>", ":NvimTreeToggle<CR>", { silent = true, desc = "Toggle file tree" })
    end,
  },

  -- Fuzzy finder (replaces ctrlp)
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      map("n", "<C-f>", builtin.find_files, { desc = "Find files" })
      map("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
      map("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
    end,
  },

  -- Treesitter for better syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "typescript", "tsx", "javascript",
          "go", "gomod", "gosum",
          "python",
          "lua", "vim", "vimdoc",
          "html", "css", "json", "yaml", "markdown",
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        -- Servers are configured explicitly below; disable automatic_enable
        -- to avoid auto-starting unrelated installed servers (e.g. stylua).
        automatic_enable = false,
        ensure_installed = {
          "ts_ls",         -- TypeScript
          "gopls",         -- Go
          "pyright",       -- Python
        },
      })

      local lspconfig = require("lspconfig")
      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr, silent = true }
        map("n", "<C-g>", vim.lsp.buf.definition, opts)
        map("n", "gd", vim.lsp.buf.definition, opts)
        map("n", "K", vim.lsp.buf.hover, opts)
        map("n", "gr", vim.lsp.buf.references, opts)
        map("n", "<leader>rn", vim.lsp.buf.rename, opts)
        map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        map("n", "[d", vim.diagnostic.goto_prev, opts)
        map("n", "]d", vim.diagnostic.goto_next, opts)
        map("n", "<leader>e", vim.diagnostic.open_float, opts)
      end

      lspconfig.ts_ls.setup({ on_attach = on_attach })
      lspconfig.gopls.setup({ on_attach = on_attach })
      lspconfig.pyright.setup({
        on_attach = on_attach,
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "off",
            },
          },
        },
      })
    end,
  },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },

  -- Linting (async, runs while you type)
  {
    "mfussenegger/nvim-lint",
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        python = { "ruff" },
        typescript = { "eslint" },
        typescriptreact = { "eslint" },
        javascript = { "eslint" },
        javascriptreact = { "eslint" },
        go = { "golangcilint" },
      }
      -- Lint on save AND while typing (debounced via TextChanged)
      -- Only run if the linter binary exists to avoid ENOENT errors
      vim.api.nvim_create_autocmd({ "BufWritePost", "TextChanged", "InsertLeave", "BufEnter" }, {
        callback = function()
          local linters = lint.linters_by_ft[vim.bo.filetype] or {}
          for _, name in ipairs(linters) do
            local linter = lint.linters[name]
            local cmd = linter and linter.cmd
            if type(cmd) == "function" then cmd = cmd() end
            if cmd and vim.fn.executable(cmd) == 1 then
              lint.try_lint(name)
            end
          end
        end,
      })
    end,
  },

  -- Git signs in gutter
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },

  -- Surround (replaces vim-surround)
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },

  -- WakaTime
  { "wakatime/vim-wakatime", lazy = false },

  -- Go support
  {
    "fatih/vim-go",
    ft = "go",
    build = ":GoUpdateBinaries",
  },

}, {
  -- lazy.nvim UI config
  ui = {
    border = "rounded",
  },
})
