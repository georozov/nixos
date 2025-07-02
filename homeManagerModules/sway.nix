{ lib, config, pkgs, ... }:

let 
  cfg = config.services.sway;
in
{
  options.services.sway = {
    enable = lib.mkEnableOption "Enable Sway";
  };

  config = lib.mkIf cfg.enable {
    wayland.windowManager.sway = {
      enable = true;
      package = pkgs.swayfx;
      checkConfig = false;

      config = rec {
        terminal = "wezterm";
        modifier = "Mod4";

        startup = [
          { command = "qutebrowser"; }
          { command = "waybar"; }
        ];

        gaps = {
          inner = 5;
          outer = 10;
        };

        window.titlebar = false;

        bars = [ ];

        keybindings = lib.mkOptionDefault {
          #brightness
          "XF86MonBrightnessDown" = "exec light -U 10";
          "XF86MonBrightnessUp" = "exec light -A 10";
          
          #audio
          "XF86AudioRaiseVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ +1%";
          "XF86AudioLowerVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ -1%";
          "XF86AudioMute" = "exec pactl set-sink-mute @DEFAULT_SINK@ toggle";
        };
      };

      extraConfig = ''
        corner_radius 5
      '';
    };

    programs.waybar = {
      enable = true;

      settings = [
        {
          layer = "top";
          position = "top";
          modules-left = [ "sway/workspaces" ];
          modules-center = [ "clock" ];
          modules-right = [ "tray" "pulseaudio" "battery" ];
        }
      ];
    };
  };
}
