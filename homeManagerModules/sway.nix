{ lib, config, pkgs, ... }:

let 
  cfg = config.services.sway;
in
{
  options.services.sway = {
    enable = lib.mkEnableOption "Enable Sway";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.swaybg
    ];

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

        bindkeysToCode = true;

        input = {
          "type:keyboard" = {
            xkb_options = "caps:escape,grp:alt_shift_toggle";
            xkb_layout = "us,ru";
          };
        };
      };

      extraConfig = ''
        corner_radius 5

        input "type:touchpad" {
          natural_scroll enabled
        }

        exec_always swaybg -i ${../wallpapers/default.png} -m fill
      '';
    };
  };
}
