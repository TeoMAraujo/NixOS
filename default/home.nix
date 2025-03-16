{ config, pkgs, ... }:

{
  home.username = "paula";
  home.homeDirectory = "/home/paula";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.packages = [

  ];
  home.file = {

  };

  home.sessionVariables = {
    #  EDITOR = "emacs";
  };
  programs.ghostty = {
        settings = {
            theme = "catppuccin-mocha";
            font-size = 10;
            background-opacity = 0.8;
            keybind = [
                "ctrl+h=goto_split:left"
                "ctrl+l=goto_split:right"
            ];
        };
    };

  programs.home-manager.enable = true;   # Let Home Manager install and manage itself.

}
