{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "tjay";
  home.homeDirectory = "/home/tjay";

  nixpkgs.config.allowUnfree = true;

  programs.zsh = {
    enableAutosuggestions = true;
  };

  services.trayer.enable = true;

  home.packages = with pkgs; [
    alacritty
    amarena-theme
    arandr
    brave
    cinnamon.nemo
    firefox
    inkscape
    killall
    lxappearance
    git
    git-crypt
    gitkraken
    gimp
    gnupg
    networkmanager_dmenu
    nitrogen
    nodejs
    pavucontrol
    picom
    protonup
    spaceship-prompt
    rofi
    vscode-with-extensions
    wine-staging
    winetricks
    xarchiver
    xmobar
    xorg.libXrender
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
