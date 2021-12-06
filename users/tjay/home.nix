{ config, pkgs, ... }:

let 
    # Import zsh config file
    zshsettings = import ./configs/zsh/zsh.nix;
    nvimsettings = import ./configs/nvim/nvim.nix;
in 
{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "tjay";
  home.homeDirectory = "/home/tjay";

  # Source extra files that are too big for this one 
    programs.zsh = zshsettings pkgs;
    programs.neovim = nvimsettings pkgs;

  # Settings for XDG user directory, to declutter home directory
  xdg.userDirs = {
      enable = true;
      documents = "$HOME/Documents";
      download = "$HOME/Downloads";
      videos = "$HOME/Videos";
      music = "$HOME/Music";
      pictures = "$HOME/Pictures";
      desktop = "$HOME/Desktop";
      publicShare = "$HOME/Public";
      templates = "$HOME/Templates";
  };

  # Allow unfree packages in home-manager
  nixpkgs.config.allowUnfree = true;

  # Enable trayer
  services.trayer.enable = true;

  # My packages
  home.packages = with pkgs; [
    alacritty
    networkmanager_dmenu
    picom
    protonup
    font-awesome

    # Rice/Desktop
    amarena-theme dunst rofi spaceship-prompt xmobar

    # Command-line tools
    ffmpeg gnupg killall libnotify pass update-nix-fetchgit

    # GUI applications
    firefox gitkraken lxappearance mailspring nitrogen pavucontrol pcmanfm vscode-with-extensions xarchiver

    # Design tools
    gimp
    inkscape

    # Development
    git git-crypt gcc nodejs python3

    # Language servers for neovim; change these to whatever languages you code in
    # Please note: if you remove any of these, make sure to also remove them from nvim/config/nvim/lua/lsp.lua!!
    rnix-lsp
    sumneko-lua-language-server
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
