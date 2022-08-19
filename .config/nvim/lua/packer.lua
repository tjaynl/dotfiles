-- [[ plug.lua ]]
require('packer').startup(function(use)
    -- [[ Plugins Go Here ]]
    use 'wbthomason/packer.nvim'    -- Package manager
    use 'neovim/nvim-lspconfig'     -- Configurations for Nvim LSP
    use 'williamboman/mason.nvim'   -- Portable package manager
    use 'williamboman/mason-lspconfig.nvim'
    use 'hrsh7th/nvim-cmp'          -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp'      -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip'  -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip'          -- Snippets plugin
    use 'nvim-lualine/lualine.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'ms-jpq/chadtree'
    use 'navarasu/onedark.nvim'
end)
