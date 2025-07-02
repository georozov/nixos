{ lib, config, ... }:

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
      config = rec {
        terminal = "wezterm";
        modifier = "Mod4";
        startup = [
          { command = "qutebrowser"; }
        ];

        # #brightness
        # keybindings."XF86MonBrightnessDown" = "exec light -U 10";
        # keybindings."XF86MonBrightnessUp" = "exec light -A 10";
        #
        # #audio
        # keybindings."XF86AudioRaiseVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ +1%";
        # keybindings."XF86AudioLowerVolume" = "exec pactl set-sink-volume @DEFAULT_SINK@ -1%";
        # keybindings."XF86AudioMute" = "exec pactl set-sink-mute @DEFAULT_SINK@ toggle";
      };
    };

    programs.waybar.enable = true;
  };
}
