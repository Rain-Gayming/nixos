{config, lib, pkgs, ...}:
{
    wayland.windowManager.hyprland = {
        extraConfig = ''
       ### SOURCES ###
       source = ~/nixos/modules/home-manager/sources.conf
       debug:disable_logs = false;

       ### AUTO STARTS ###


       exec-once = waybar
       exec-once = dunst
       exec-once = hyprctl setcursor Bibata-Modern_Classic 24


       ### DISPLAY ###
       monitor=DP-1,1920x1080@60,auto,1

       ### GRAPHICS ###

       general {
         gaps_in = 5
         gaps_out = 20
         border_size = 4 
         col.active_border = rgba(8ec07caa) rgba(8ec07caa) 45deg
         col.inactive_border = rgba(b8bb26aa)
         layout = dwindle
       }

       dwindle {
         pseudotile = yes
     preserve_split = yes
       }

       gestures {
         workspace_swipe = false
       }


       decoration{
         rounding = 10

         shadow {
            enabled = true
            range = 10
            render_power = 3
            color = rgba(b8bb26aa)
         }

         blur {
           enabled = true
           size = 3
           passes = 1

           vibrancy = 0.1696
         }
       }

       #### INPUTS ####
       $mainMod = SUPER

       input {
         kb_layout = gb
     follow_mouse = 1
       }


       bind = $mainMod, F11, fullscreen
        bind = $mainMod SHIFT, S, exec,      hyprshot -m region

       ## opens ##
       bind = $mainMod, D, exec, rofi -show run
       bind = $mainMod, Q, exec, kitty
       bind = $mainMod, F, exec, firefox
       bind = $mainMod, C, killactive
       bind = $mainMod, P, exit

       ## scale apps ##
       bindm = $mainMod, mouse:272, movewindow
       bindm = $mainMod, moues:273, resizewindow

       ## change focus ##
       bind = $mainMod, left, movefocus, l
       bind = $mainMod, right, movefocus, r
       bind = $mainMod, up, movefocus, u
       bind = $mainMod, down, movefocus, d

       bind = $mainMod, h, movefocus, l
       bind = $mainMod, l, movefocus, r
       bind = $mainMod, j, movefocus, u
       bind = $mainMod, k, movefocus, d

       ## workspaces ##
       bind = $mainMod, 1, workspace, 1
       bind = $mainMod, 2, workspace, 2
       bind = $mainMod, 3, workspace, 3
       bind = $mainMod, 4, workspace, 4
       bind = $mainMod, 5, workspace, 5
       bind = $mainMod, 6, workspace, 6
       bind = $mainMod, 7, workspace, 7
       bind = $mainMod, 8, workspace, 8
       bind = $mainMod, 9, workspace, 9
       bind = $mainMod, 0, workspace, 10

       ## move to work spaces ##

       bind = $mainMod SHIFT, 1, movetoworkspace, 1
       bind = $mainMod SHIFT, 2, movetoworkspace, 2
       bind = $mainMod SHIFT, 3, movetoworkspace, 3
       bind = $mainMod SHIFT, 4, movetoworkspace, 4
       bind = $mainMod SHIFT, 5, movetoworkspace, 5
       bind = $mainMod SHIFT, 6, movetoworkspace, 6
       bind = $mainMod SHIFT, 7, movetoworkspace, 7
       bind = $mainMod SHIFT, 8, movetoworkspace, 8
       bind = $mainMod SHIFT, 9, movetoworkspace, 9
       bind = $mainMod SHIFT, 0, movetoworkspace, 10
        '';
    };
}
