{
  programs.qutebrowser = {
    enable = true;

    keyBindings = {
      normal = {
        "J" = "tab-prev";
        "K" = "tab-next";
      };
    };

    settings = {
      colors.webpage.darkmode.enabled = true;
    };
  };
}
