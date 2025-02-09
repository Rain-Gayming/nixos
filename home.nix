{ config, pkgs, ... }:

{
    imports = [
        ./modules/home-manager/hyprland.nix
        ./modules/home-manager/waybar.nix
        #        ./modules/home-manager/kitty.nix
        #        ./modules/home-manager/stylix.nix
    ];
    
    stylix = {
        enable = true;
        autoEnable = true;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-medium.yaml";
    };
    
    home.username = "rain";
    home.homeDirectory = "/home/rain";

    wayland.windowManager.hyprland.enable = true;

    # neovim
    programs.neovim = {
        enable = true;

        viAlias = true;
        vimAlias = true; 

        extraLuaConfig = ''
          ${builtins.readFile ./nvim/init.lua}
        '';
    };

    xdg.configFile = {
	"nvim/init.lua".source = ./nvim/init.lua;
	"nvim/lua".source = ./nvim/lua;
    };

    home.stateVersion = "24.11"; 
    
    home.packages = [
    ];
    home.file = {
    };

    home.sessionVariables = {
    };

    programs.home-manager.enable = true;
}
