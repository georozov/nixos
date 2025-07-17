{ lib, inputs, config, builtins, ... }:
let
  cfg = config.services.nixvim;
in
{
  imports = [ inputs.nixvim.homeManagerModules.nixvim ];

  options.services.nixvim = {
    enable = lib.mkEnableOption "Enable nixvim";
  };

  config = lib.mkIf cfg.enable {
    programs.nixvim = {
      enable = true;

      globals = {
        mapleader = " ";
      };

      opts = {
        tabstop = 2;
        softtabstop = 2;
        shiftwidth = 2;
        expandtab = true;
      };

      keymaps = [
        {
          key = "<leader>pv";
          action = "<cmd> Ex <CR>";
        }
        {
          key = "<C-l>";
          action = "<cmd> nohl <CR>";
        }
        {
          key = "<C-l>";
          action = "<cmd> nohl <CR>";
        }
      ];

      plugins = {
        web-devicons.enable = true;

        harpoon = {
          enable = true;
          enableTelescope = true;
        };

        telescope = {
          enable = true;
          keymaps = {
            "<C-p>".action = "git_files";
            "<leader>ps".action = "live_grep";
            "<leader>pf".action = "find_files";
          };
        };
        
        tmux-navigator = {
          enable = true;

          keymaps = [
            {
              action = "left";
              key = "<M-h>";
            }
            {
              action = "down";
              key = "<M-j>";
            }
            {
              action = "up";
              key = "<M-k>";
            }
            {
              action = "right";
              key = "<M-l>";
            }
          ];
        };
      };
    };
  };
}
