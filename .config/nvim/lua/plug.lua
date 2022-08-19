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

-- [[ Theme ]]                                                                  
require('onedark').setup {                                                      
    style = 'darker'                                                             
}                                                                               
require('onedark').load()                                                       

-- [[ Mason settings ]]
require("mason").setup()                                                        
require("mason-lspconfig").setup({
    ensure_installed = { "html", "css-lsp", "emmet_ls", "astro" },
    automatic_installation = true,
})

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'html', 'cssls', 'emmet_ls', 'astro' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

-- [[ Lua line]]                                                                
require('lualine').setup {                                                      
  options = {                                                                    
    icons_enabled = true,                                                        
    theme = 'onedark',                                                             
    component_separators = { left = '', right = ''},                           
    section_separators = { left = '', right = ''},                             
    disabled_filetypes = {                                                       
      statusline = {},                                                           
      winbar = {},                                                               
    },                                                                           
    ignore_focus = {},                                                           
    always_divide_middle = true,                                                 
    globalstatus = false,                                                        
    refresh = {                                                                  
      statusline = 1000,                                                         
      tabline = 1000,                                                            
      winbar = 1000,                                                             
    }                                                                            
  },                                                                             
  sections = {                                                                   
    lualine_a = {'mode'},                                                        
    lualine_b = {'branch', 'diff', 'diagnostics'},                               
    lualine_c = {'filename'},                                                    
    lualine_x = {'encoding', 'fileformat', 'filetype'},                          
    lualine_y = {'progress'},                                                    
    lualine_z = {'location'}                                                     
  },                                                                             
  inactive_sections = {                                                          
    lualine_a = {},                                                              
    lualine_b = {},                                                              
    lualine_c = {'filename'},                                                    
    lualine_x = {'location'},                                                    
    lualine_y = {},                                                              
    lualine_z = {}                                                               
  },                                                                             
  tabline = {},                                                                  
  winbar = {},                                                                   
  inactive_winbar = {},                                                          
  extensions = {}
}
