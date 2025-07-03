{pkgs, ...}:
{
  home.packages = [
    pkgs.font-awesome
  ];

  programs.waybar = {
    enable = true;

    settings = [
      {
        layer = "top";
        position = "top";
        height = 30;
        margin = "15 15 0";

        modules-left = [ "clock" ];
        modules-center = [ "sway/workspaces" ];
        modules-right = [ "tray" "pulseaudio" "battery" ];
      }
    ];

    style = ''
      #waybar {
        border: none;
        border-radius: 5px;
        transition-property: background-color;
        transition-duration: 0.5s;
        padding: 0 10px;
      }

      .modules-left {
        margin: 0 10px;
      }

      .modules-right {
        margin: 0 10px;
      }
    '';
  };
}
