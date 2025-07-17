{ pkgs, ... }:
{
  imports = [
    ./starship.nix
  ];

  home.packages = [
    pkgs.thefuck
  ];

  programs.zsh = {
    enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "thefuck" ];
    };

    plugins = [
        {
          name = "vi-mode";
          src = pkgs.zsh-vi-mode;
          file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
        }
    ];
  };
}
