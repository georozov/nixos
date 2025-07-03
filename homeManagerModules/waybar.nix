{
  programs.waybar = {
    enable = true;

    settings = [
      {
        layer = "top";
        position = "top";

        modules-left = [ "clock" ];
        modules-center = [ "sway/workspaces" ];
        modules-right = [ "tray" "pulseaudio" "battery" ];

        height = 30;

        margin-top = 15;
        margin-left = 15;
        margin-right = 15;
      }
    ];
  };
}
