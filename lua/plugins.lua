local packer = require("packer")
packer.startup(
    {
        function(use)
            use 'wbthomason/packer.nvim'
            use 'sainnhe/sonokai'
            use 'nvim-tree/nvim-web-devicons'
            use 'nvim-tree/nvim-tree.lua'
            use 'akinsho/toggleterm.nvim'
            use ({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})
            use ({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
            use ("arkav/lualine-lsp-progress")
            use ({ 'nvim-telescope/telescope.nvim', tag = '0.1.1', requires = { {'nvim-lua/plenary.nvim'} } })
            use 'glepnir/dashboard-nvim'
            use ({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
            use 'williamboman/nvim-lsp-installer'
            use 'neovim/nvim-lspconfig'
        end,
        config = {
            max_jobs = 16,
        },
    }
)
