# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, inputs, lib, pkgs, ... }:

{
    imports =
        [ # Include the results of the hardware scan.
            ./hardware-configuration.nix      
            inputs.home-manager.nixosModules.default
            #./modules/nixos/stylix.nix
        ];

    stylix.enable = true;
    stylix.autoEnable = false;
    stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    stylix.image = ./wallpaper.png; 
    #drive support 
    hardware.opentabletdriver.enable = true;
    # unfree apps
    nixpkgs.config.allowUnfree = true;
    # zsh
    programs.zsh.enable = true;

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # bluetooth
    hardware.bluetooth.enable = true;

    # nix features
    nix.settings.experimental-features = ["nix-command" "flakes"];

    users.users.rain = {
        isNormalUser = true;
        description = "catgirl programmer uwu";
        extraGroups = ["Networkmanager" "wheel"];
    };

    home-manager = {
        extraSpecialArgs = {inherit inputs;};
        users = {
            "rain" = import ./home.nix;
        };
    };

    fonts.packages = with pkgs;[
        noto-fonts
        fira-code
        fira-code-symbols
        nerd-fonts.fira-code
        font-awesome
    ];

    hardware.graphics.enable = true;


    # audio
    services.pulseaudio.enable = true;
    services.pulseaudio.support32Bit = true;

    networking.hostName = "nixos"; # Define your hostname.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking
    networking.networkmanager.enable = true;

    # Set your time zone.
    time.timeZone = "Europe/London";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_GB.UTF-8";

    i18n.extraLocaleSettings = {
        LC_ADDRESS = "en_GB.UTF-8";
        LC_IDENTIFICATION = "en_GB.UTF-8";
        LC_MEASUREMENT = "en_GB.UTF-8";
        LC_MONETARY = "en_GB.UTF-8";
        LC_NAME = "en_GB.UTF-8";
        LC_NUMERIC = "en_GB.UTF-8";
        LC_PAPER = "en_GB.UTF-8";
        LC_TELEPHONE = "en_GB.UTF-8";
        LC_TIME = "en_GB.UTF-8";
    };

    # Configure keymap in X11
    services.xserver.xkb = {
        layout = "gb";
        variant = "";
    };

    # Configure console keymap
    console.keyMap = "uk";

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
        ### TERMINAL ###

        # terminal emulator
        kitty

        # text editor 
        neovim
        hyfetch
        # coding
        git
        cargo
        zig
        gcc
        go
        lua
        nodejs

        # file manager
        yazi
        ### GUI ###

        # bar
        waybar

        # browser
        firefox

        # notes
        qownnotes
        obsidian

        # messaging
        vesktop

        # art 
        gimp
        blockbench

        ### MISC ###
        hyprshot
        rofi-wayland
        unzip
        zip
        dolphin
        gnumake
        curl
        wget
        gnutar
        gzip
    ];

    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # programs.mtr.enable = true;
    # programs.gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };

    # List services that you want to enable:

    # Enable the OpenSSH daemon.
    # services.openssh.enable = true;

    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # networking.firewall.enable = false;

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "24.11"; # Did you read the comment?

}
