{ config, pkgs, ... }:

let
  unstable = import <nixos-unstable> {};
in
{

# ------------------------------------------------------------------------
# IMPORTS
# ------------------------------------------------------------------------

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/pipewireLowLatency.nix
    ];

# ------------------------------------------------------------------------
# BOOT
# ------------------------------------------------------------------------
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    # Kernel
    kernelPackages = pkgs.linuxKernel.packages.linux_zen;
  };

# ------------------------------------------------------------------------
# HARDWARE
# ------------------------------------------------------------------------

  hardware = {
    cpu.amd.updateMicrocode = true;
    opengl = {
      enable = true;
      driSupport = true;
      package = pkgs.mesa.drivers;
      driSupport32Bit = true;
      package32 = pkgs.pkgsi686Linux.mesa.drivers;
    };
  };

# ------------------------------------------------------------------------
# NETWORKING
# ------------------------------------------------------------------------

  networking = {
    hostName = "nixos";
    useDHCP = false;
    interfaces.enp3s0.useDHCP = true;

    # firewall
    #firewall = {
      # Open ports in the firewall.
    #  allowedTCPPorts = [ ... ];
    #  allowedUDPPorts = [ ... ];
      # Or disable the firewall altogether.
    #  enable = false; # Or disable the firewall altogether.
    #};
  };

# ------------------------------------------------------------------------
# LOCALE
# ------------------------------------------------------------------------

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

# ------------------------------------------------------------------------
# LOGIN & WINDOW MANAGER
# ------------------------------------------------------------------------

  services.xserver = {
    enable = true;
    displayManager = {
      lightdm.enable = true;
      defaultSession = "none+xmonad";
    };

    windowManager = {
      qtile.enable = true;
      xmonad.enable = true;
      xmonad.enableContribAndExtras = true;
      xmonad.extraPackages = hpkgs: [
        hpkgs.xmonad
        hpkgs.xmonad-contrib
        hpkgs.xmonad-extras
      ];
    };
  };

  # Extra settings
  services.xserver = {
    # Configure keymap in X11
    layout = "us";
    xkbOptions = "eurosign:e";

    # Disable mouse acceleration
    libinput = { 
      enable = true; # Enable touchpad support (enabled default in most desktopManager).
      mouse ={ 
        accelProfile = "flat";
        accelSpeed = "0";
      };
    };
  };

# ------------------------------------------------------------------------
# SERVICES
# ------------------------------------------------------------------------
  services = {
    flatpak.enable = true; # Flatpak
    gvfs.enable = true; # Auto mount external drives
    # printing.enable = true; # Enable CUPS to print documents.
    # openssh.enable = true; # Enable the OpenSSH daemon.
  };

# ------------------------------------------------------------------------
# SOUND
# ------------------------------------------------------------------------

  # Pipewire audio with lowLatency
  services.pipewire = {
    enable = true;
    
    # alsa
    alsa.enable = true;
    alsa.support32Bit = true;
    
    pulse.enable = true; # Pulseaudio
    
    lowLatency.enable = true; # The star of the show

    lowLatency = { # Defaults (no need to be set unless modified)
      quantum = 64;
      rate = 48000;
    };
  };

  # Extra PipeWire options
  # services.pipewire.jack.enable = true;
  # services.jack.loopback.enable = true;

# ------------------------------------------------------------------------
# Programs
# ------------------------------------------------------------------------

  programs = {
    # zsh
    zsh = {
      enable = true;
      promptInit = ''
        autoload -U promptinit && promptinit && prompt spaceship
      '';
    };

    # Games
    gamemode.enable = true;
    steam.enable = true;
    
    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    #mtr.enable = true;
    #gnupg.agent = {
    #  enable = true;
    #  enableSSHSupport = true;
    #};
  };

# ------------------------------------------------------------------------
# USER(S)
# ------------------------------------------------------------------------
  users.users.tjay = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
  };

# ------------------------------------------------------------------------
# SYSTEM FONTS
# ------------------------------------------------------------------------

  fonts = {
    fonts = with pkgs; [
      font-awesome
      powerline-fonts
      fira
      fira-code
      fira-code-symbols
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
    ];
  };

# ------------------------------------------------------------------------
# PACKAGES
# ------------------------------------------------------------------------

  nixpkgs.config.allowUnfree = true; # Allow Unfree packages

  environment.systemPackages = with pkgs; [ # Search with "nix search <appname>"
    alacritty
    dmenu
    git
    htop
    networkmanager_dmenu
    polkit_gnome
    qutebrowser
    ranger
    spaceship-prompt
    vim
    wget
  ];

# ------------------------------------------------------------------------
# ESSENTIALS
# ------------------------------------------------------------------------
  # PipeWire essentials
  security.rtkit.enable = true;

  # Polkit needed by WM
  security.polkit.enable = true;

  # Flatpak essentials
  xdg.portal.enable = true;

# ------------------------------------------------------------------------
# NIX TWEAKS
# ------------------------------------------------------------------------

  # Optimize storage
  nix = {
    autoOptimiseStore = true; # Automate `nix-store --optimise`
    
    gc = { # Automate garbage collection
      automatic = true;
      dates     = "weekly";
      options   = "--delete-older-than 7d";
    };

    # Avoid unwanted garbage collection when using `nix-direnv`
    # extraOptions = ''
    #   keep-outputs     = true;
    #   keep-derivations = true;
    # '';

    trustedUsers = [ "root" "tjay" ]; # Required by Cashix to be used as non-root user
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11"; # Did you read the comment?
  
}
