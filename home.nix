{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./imports/programs/kitty.nix
    ./imports/programs/bash.nix
    ./imports/programs/starship.nix
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.seunome = import ./paula.nix;
  };

  home.username = "paula";
  home.homeDirectory = "/home/paula";

  home.enableNixpkgsReleaseCheck = true; # Habilitado para acompanhar versão do sistema

  home.packages = with pkgs; [
  ];

  programs = {
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
  home.stateVersion = "25.05"; # Please read the comment before changing.
}
