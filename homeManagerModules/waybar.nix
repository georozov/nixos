{pkgs, ...}:
{
  home.packages = with pkgs; [
    font-awesome
    nerd-fonts.jetbrains-mono
  ];

  programs.waybar = {
    enable = true;

    settings = [
      {
        layer = "top";
        position = "top";
        margin = "15 15 0";

        height = 30;

        modules-left = [ "clock" "tray" ];
        modules-center = [ "sway/workspaces" ];
        modules-right = [ "pulseaudio" "battery" ];

        "battery" = {
          "states" = {
            "warning" = 30;
            "critical" = 15;
          };
          "format" = "{icon} {capacity}%";
          "format-charging" = "󱐋 {capacity}%";
          "interval" = 1;
          "format-icons" = ["󰂎" "󰁼" "󰁿" "󰂁" "󰁹"];
          "tooltip" = true;
        };

        "pulseaudio" = {
          "format" = "{icon}{volume}%";
          "format-muted" = "󰖁 0%";
          "format-icons" = {
            "headphone" = " ";
            "hands-free" = " ";
            "headset" = " ";
            "phone" = " ";
            "portable" = " ";
            "car" = " ";
            "default" = [
              " "
              " "
              " "
            ];
          };
          "on-click-right" = "pavucontrol -t 3";
          "on-click" = "pactl -- set-sink-mute 0 toggle";
          "tooltip" = true;
          "tooltip-format" = "Volume: {volume}%";
        };

        "clock" = {
          "interval" = 1;
          "timezone" = "Europe/Istanbul";
          "format" = "<span color='#BF00FF'>   </span>{:%H:%M} ";
          "tooltip" = true;
          "tooltip-format" = "{:L%d.%m.%Y, %A}";
        };
      }
    ];

    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font", "Font Awesome 6 Free", "Font Awesome 6 Free Solid";
        font-size: 16px;
        border-radius: 0;
        min-height: 0;
        border: none;
        font-weight: bold;
      }

      #waybar {
        color: #cdd6f4;
        background-color: rgba(24, 24, 37, 1.0);
        border: none;
        border-radius: 5px;
        transition-property: background-color;
        transition-duration: 0.5s;
      }

      .modules-left {
        margin: 0 10px;
      }

      .modules-right {
        margin: 0 10px;
      }

      .modules-left * {
        border-radius: 4px;
        padding: 0 10px;
        margin: 8px 8px 8px 0;
      }

      .modules-right * {
        border-radius: 4px;
        padding: 0 10px;
        margin: 8px 0 8px 8px;
      }

      #workspaces {
        border: none;
        box-shadow: none;
      }

      #workspaces button {
        all: initial;
        min-width: 0;
        box-shadow: inset 0 -3px transparent;
        padding: 6px 12px;
        margin: 6px 3px;
        border-radius: 4px;
        background-color: rgba(36, 36, 52, 1.0);
        color: #cdd6f4;
      }

      #workspaces button.focused {
        color: #1e1e2e;
        background-color: #cdd6f4;
      }

      #workspaces button:hover {
        box-shadow: inherit;
        text-shadow: inherit;
        color: #1e1e2e;
        background-color: #cdd6f4;
      }

      #battery {
        background-color: orange;
      }

      #pulseaudio {
        background-color: blue;
      }

      #clock {
        border: solid 1px #BF00FF;
        border-radius: 4px;
      }
    '';
  };
}
