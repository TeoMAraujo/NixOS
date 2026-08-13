{ config, pkgs, inputs, ... }:
{
  imports = [
    ./imports/programs/kitty.nix
    ./imports/programs/bash.nix
    ./imports/programs/starship.nix
  ];

  home.packages = with pkgs; [
  ];

  programs.git = {
    enable = true;
    userName = "TeoMAraujo";
    userEmail = "teoaraujoufmg@gmail.com";
  };

  home.file = { };

  home.sessionVariables = {
    # EDITOR = "nvim";
  };

  home.stateVersion = "25.05";
}
