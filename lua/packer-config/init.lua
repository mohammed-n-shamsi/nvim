return require 'packer'.startup(function(use)
    -- Package manager
    use 'wbthomason/packer.nvim'

    -- Colorscheme
    use 'EdenEast/nightfox.nvim'

    -- File tree
    use 'kyazdani42/nvim-web-devicons' -- File icons

    -- LSP
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-buffer' -- For looking at current file completions
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'hrsh7th/cmp-path' -- For looking for file paths
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    use 'onsails/lspkind-nvim' -- Adding icons to the completions
    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
        config = function()
            local saga = require("lspsaga")
            saga.init_lsp_saga({
                --setup
            })
        end,
    })
    use 'simrat39/rust-tools.nvim'

    -- Notifications
    use 'rcarriga/nvim-notify'

    -- Line
    use 'nvim-lualine/lualine.nvim'

    -- Nice tabs
    use 'romgrk/barbar.nvim'

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Commenter
    use 'numToStr/Comment.nvim'

    -- Neovim surround
    use "kylechui/nvim-surround"

    -- Fuzzy finder
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { 'nvim-telescope/telescope-ui-select.nvim' }

    -- REPL
    use { 'hkupty/iron.nvim' }

    -- Trouble
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    -- Todo Comments
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    -- Filetypes.vim replacement
    use("nathom/filetype.nvim")

    -- Color show
    use {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup {
            }
        end
    }

    -- gitsigns
    use { 'lewis6991/gitsigns.nvim' }

    use 'nvim-lua/plenary.nvim'
    use 'mfussenegger/nvim-dap'

end)
