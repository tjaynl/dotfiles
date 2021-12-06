# This is my configuration file for neovim.
# I've written it in nix for ease of use with home-manager, 
# but there are several vimscript and lua files imported as well.
# If you want more help understanding or modifying these configurations, 
# please submit an issue on Github or contact me on Discord 'notusknot#5622'
{ pkgs, config, ... }:

{
    enable = true;
    plugins = with pkgs.vimPlugins; [
        # File tree
        nvim-web-devicons 
        nvim-tree-lua

        # LSP
        nvim-lspconfig

        # Languages
        vim-nix

        # Eyecandy 
        nvim-treesitter
        bufferline-nvim
        galaxyline-nvim
        nvim-colorizer-lua
        onehalf
        pears-nvim

        # Lsp and completion
        nvim-lspconfig
        nvim-compe

        # Telescope
        telescope-nvim

        # Indent lines
        indent-blankline-nvim
    ];
    extraConfig = ''
        luafile /home/tjay/.dotfiles/users/tjay/configs/nvim/lua/settings.lua
    '';
}

