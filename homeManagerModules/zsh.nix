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
  };
}
