{ config, pkgs, ... }:

{
    imports = [
        ./modules/home-manager/hyprland.nix
        ./modules/home-manager/waybar.nix
        ./modules/home-manager/kitty.nix
        #        ./modules/home-manager/stylix.nix
    ];
    
   
    home.username = "rain";
    home.homeDirectory = "/home/rain";
    
    programs.kitty.enable = true;
    stylix.targets.kitty.enable = true;
    #    stylix.cursor.name = "catppuccin-cursors";
    stylix.cursor.size = 20;


#gtk = {
    #      enable = true;
    #   cursorTheme = {
    #        name = "phingers-cursors-dark";
    #        package = pkgs.phinger-cursors;
    #        size = 28;
    #    };
    #};
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
