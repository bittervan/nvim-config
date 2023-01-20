local packer = require("packer")
packer.startup(
    {
        function(use)
            use 'wbthomason/packer.nvim'
            use 'sainnhe/sonokai'
            use 'nvim-tree/nvim-web-devicons'
            use 'nvim-tree/nvim-tree.lua'
            use 'akinsho/toggleterm.nvim'
            use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }})
        end,
        config = {
            max_jobs = 16,
        },
    }
)
