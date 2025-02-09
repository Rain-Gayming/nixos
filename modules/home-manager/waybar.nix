{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        margin = "9 13 -10 18";

        modules-left = ["hyprland/workspaces"];
        modules-center = ["clock"];
        modules-right = ["pulseaudio" "memory" "cpu""battery" "tray"];

        "hyprland/workspaces" = {
          disable-scroll = true;
        };

    clock = { 
        format = "  {:%A - %B %d, %Y - %R}";
    };
    pulseaudio = {
	tooltip = false;
	scroll-step = 5;
	format = "{icon}  {volume}%";
	format-muted = "muted";
	on-click = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
	format-icons = {
		default = ["" "" ""];
	};
    };

    memory = {
        interval = 2;
        format = "{}%  ";
        max-length = 10;
    };

    cpu = {
      interval = 2;
      format = "{usage}% ";
      min-length = 6;
    };


    battery = {
        states = {
            warning = 30;
            critical = 15;
        };
        format = "{capacity}% {icon}";
        format-charging = "{capacity}% {icon} ";
        format-plugged = "{capacity}% ";
        format-alt = "{time} {icon}";
        format-icons = ["" "" "" "" ""];
	on-update = "$HOME/.config/waybar/scripts/check_battery.sh";
    };

    tray = {
        icon-size = 16;
        spacing = 0;
    };

      };
    };
  
    style = 
      ''
* {
    border: none;
    border-radius: 10; 
    font-family: fira-code;
    font-weight: bold; 
    min-height: 20px; 
}

window#waybar {
    background: transparent;
}

window#waybar.hidden {
    opacity: 0.2;
}

#workspaces {
    margin-right: 8px;
    border-radius: 10px;
    transition: none;
    background-color: #8ec07c;
}

#workspaces button {
    transition: none;
    color: #282828;
    background: transparent;
    padding: 5px;
    font-size: 18px;
}

#workspaces button.persistent {
    font-size: 12px;
}

/* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
#workspaces button:hover {
    transition: none;
    box-shadow: inherit;
    text-shadow: inherit;
    border-radius: inherit;
    color: #383c4a;
    background-color: #689d6a;
}

#workspaces button.active {
    background: #689d6a;
    color: white;
    border-radius: inherit;
}


#clock {
    margin-top: 0px;
    margin-left: 8px;
    padding-left: 10px;
    padding-right: 10px;
    border-radius: 10px;
    transition: none;
    color: #282828;

    border-style: solid;
    background-color: #8ec07c;
}

#pulseaudio {
    margin-right: 8px;
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px;
    transition: none;
    color: #282828;
    background-color: #8ec07c;
}

#pulseaudio.muted {
    background-color: #fb4934;
    color: #282828;
}

#memory {
    margin-right: 8px;
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px;
    transition: none;
    color: #282828;
    background-color: #8ec07c;
}

#cpu {
    margin-right: 8px;
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px;
    transition: none;
    color: #282828;
    background-color: #8ec07c;
}

#cpu:hover {
    background-color: #689d6a;
}
#memory:hover {
    background-color: #689d6a;
}
#pulseaudio:hover {
    background-color: #689d6a;
}
#battery:hover {
    background-color: #689d6a;
}
#clock:hover {
    background-color: #689d6a;
}
#battery {
    margin-right: 8px;
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px;
    transition: none;
    color: #282828;
    background-color: #8ec07c;
}

#battery.charging {
    color: #282828;
}

#battery.warning:not(.charging) {
    color: black;
}

#battery.critical:not(.charging) {
    animation-name: blink;
    color: #282828;
    animation-duration: 0.5s;
    animation-timing-function: linear;
    animation-iteration-count: infinite;
    animation-direction: alternate;
}

#tray {
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px;
    transition: none;
    color: #282828;
}

@keyframes blink {
    to {
        background-color: #ffffff;
        color: #000000;
    }
}
      '';
  };
}
