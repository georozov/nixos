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
          key = "<C-h>";
          action = "<C-w>h";
	}
        {
          key = "<C-j>";
          action = "<C-w>j";
	}
        {
          key = "<C-k>";
          action = "<C-w>k";
	}
        {
          key = "<C-l>";
          action = "<C-w>l";
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
      };
    };
  };
}
