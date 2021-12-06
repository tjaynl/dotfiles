{ pkgs, config, ... }:

{
  enable = true;
  dotDir =  ".config/zsh";
  initExtra = ''
    autoload -U promptinit && promptinit && prompt spaceship
    autoload -U colors && colors
    # Variables
    export EDITOR="nvim"
    export TERMINAL="alacritty"
    export BROWSER="firefox"
    export PATH=$NIXOS_CONFIG_DIR/scripts/:$PATH
    '';

    # Tweak settings for history
    history = {
        save = 1000;
        size = 1000;
        path = "$HOME/.cache/zsh_history";
    };

    # Set some aliases
    shellAliases = {
        v = "nvim";
        c = "clear";
        unziptar = "tar -xvzf";
    };

    # Source all plugins, nix-style
    plugins = [
    {
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-autosuggestions";
            rev = "a411ef3e0992d4839f0732ebeb9823024afaaaa8";
            sha256 = "1g3pij5qn2j7v7jjac2a63lxd97mcsgw6xq6k5p7835q9fjiid98";
        };
    }];
}
