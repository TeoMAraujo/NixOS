{ config, pkgs, inputs, ... }:
{
  imports = [
    ./programs/kitty.nix
    ./programs/bash.nix
    ./programs/starship.nix
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
