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

    oh-my-zsh = { # "ohMyZsh" without Home Manager
      enable = true;
      plugins = [ "git" "thefuck" ];
      theme = "robbyrussell";
    };
  };
}
