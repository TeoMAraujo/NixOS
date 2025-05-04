 { config, pkgs, inputs, ... }:
  
   {
     home.username = "paula";
     home.homeDirectory = "/home/paula";
  
     home.stateVersion = "24.11"; # Please read the comment before changing.
     home.packages = with pkgs; [
     ];
 
   programs = {
        ghostty = {
        enable = true;
          settings = {
            theme = "catppuccin-mocha";
            font-size = 10;
            background-opacity = 0.8;
            cursor-style = "bar";
            cursor-style-blink = true;
            adjust-cursor-thickness = 2;
            keybind = [
                "ctrl+h=goto_split:left"
                "ctrl+l=goto_split:right"
            ];
          };
        };
 
        git = {
          enable = true;
          userName = "TeoMAraujo";
          userEmail = "teoaraujoufmg@gmail.com";
        };
  };
       home.file = {
    };
 
    home.sessionVariables = {
      # EDITOR = "emacs";
    };
 
    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
  }
