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
    use 'hrsh7th/nvim-cmp'         -- Autocompletion plugin
    use 'hrsh7th/cmp-buffer'       -- For looking at current file completions
    use 'hrsh7th/cmp-nvim-lsp'     -- LSP source for nvim-cmp
    use 'hrsh7th/cmp-path'         -- For looking for file paths
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip'         -- Snippets plugin
    use 'onsails/lspkind-nvim'     -- Adding icons to the completions
    use({
        "glepnir/lspsaga.nvim",
        branch = "main",
        config = function()
            local saga = require("lspsaga")
            saga.setup({
                code_action_lightbulb = {
                    enable = false
                }
            })
        end,
    })
    use 'simrat39/rust-tools.nvim'
    use({
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("null-ls").setup()
        end,
        requires = { "nvim-lua/plenary.nvim" },
    })

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
    -- use "kylechui/nvim-surround"

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

    -- for debugging
    use 'nvim-lua/plenary.nvim'
    use 'mfussenegger/nvim-dap'

    -- indexing progress bar
    use 'j-hui/fidget.nvim'

    -- auto close
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    -- md show
    use { "ellisonleao/glow.nvim" }


    -- tabout
    -- Lua
    use {
        'abecodes/tabout.nvim',
        config = function()
            require('tabout').setup {
                tabkey = '<Tab>',             -- key to trigger tabout, set to an empty string to disable
                backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
                act_as_tab = true,            -- shift content if tab out is not possible
                act_as_shift_tab = false,     -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
                default_tab = '<C-t>',        -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
                default_shift_tab = '<C-d>',  -- reverse shift default action,
                enable_backwards = true,      -- well ...
                completion = true,            -- if the tabkey is used in a completion pum
                tabouts = {
                    { open = "'", close = "'" },
                    { open = '"', close = '"' },
                    { open = '`', close = '`' },
                    { open = '(', close = ')' },
                    { open = '[', close = ']' },
                    { open = '{', close = '}' }
                },
                ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
                exclude = {} -- tabout will ignore these filetypes
            }
        end,
        wants = { 'nvim-treesitter' }, -- or require if not used so far
        after = { 'nvim-cmp' }         -- if a completion plugin is using tabs load it before
    }


    -- traversal
    use {
        "ggandor/leap.nvim",
        config = function() require('leap').add_default_mappings() end
    }
end)
