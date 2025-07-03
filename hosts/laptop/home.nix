{ config, pkgs, ... }:
{
  home.username = "snuff";
  home.homeDirectory = "/home/snuff";

  imports = [
    ../../homeManagerModules/sway.nix
    ../../homeManagerModules/waybar.nix
    ../../homeManagerModules/nixvim.nix
    ../../homeManagerModules/qutebrowser.nix
    ../../homeManagerModules/zsh.nix
  ];

  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    tmux
    firefox
    wezterm
    ripgrep
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    XKB_DEFAULT_OPTIONS = "caps:escape";
  };

  home.shellAliases = {
    srebuild = "sudo nixos-rebuild switch --flake ~/nixos#laptop";
    stest = "sudo nixos-rebuild test --flake ~/nixos#laptop";
  };

  programs.home-manager.enable = true;

  programs.zsh.enable = true;

  programs.git = {
    enable = true;
    userName = "Jorge";
    userEmail = "rozov2004@list.ru";
  };

  services.sway.enable = true;
  services.nixvim.enable = true;
}
