{ pkgs, lib, ... }: 
let
  vim-tmux-navigator = pkgs.tmuxPlugins.vim-tmux-navigator.overrideAttrs(attrs: {
    version = "2025-07-15";
    src = pkgs.fetchFromGitHub {
      owner = "christoomey";
      repo = "vim-tmux-navigator";
      rev = "c45243dc1f32ac6bcf6068e5300f3b2b237e576a";
      hash = "sha256-IEPnr/GdsAnHzdTjFnXCuMyoNLm3/Jz4cBAM0AJBrj8=";
    };
  });
in
{
  home.packages = [ pkgs.tmux ];

  programs.tmux = {
    enable = true;
    shortcut = "b";
    keyMode = "emacs";
    terminal = "screen-256color";

    extraConfig = ''
      bind -n M-n previous-window
      bind -n M-m next-window

      set -g escape-time 0
      set -g focus-events on
    '';

    plugins = with pkgs; [
      {
        plugin = vim-tmux-navigator;
        extraConfig = ''
          set -g @vim_navigator_mapping_left "M-h"
          set -g @vim_navigator_mapping_down "M-j"
          set -g @vim_navigator_mapping_up "M-k"
          set -g @vim_navigator_mapping_right "M-l"
          set -g @vim_navigator_mapping_prev ""

          bind  c  new-window      -c "#{pane_current_path}"
          bind  %  split-window -h -c "#{pane_current_path}"
          bind '"' split-window -v -c "#{pane_current_path}"
        '';
      }
      {
        plugin = tmuxPlugins.rose-pine;
        extraConfig = "set -g @rose_pine_variant 'main'";
      }
    ];
  };
}
