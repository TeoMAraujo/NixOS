{
  config,
  pkgs,
  inputs,
  nixvim,
  ...
}:

{
  imports = [
    ./imports/programs
  ];

  home.username = "paula";
  home.homeDirectory = "/home/paula";

  home.stateVersion = "25.05"; # Please read the comment before changing.
  home.enableNixpkgsReleaseCheck = true; # Habilitado para acompanhar versão do sistema

  home.packages = with pkgs; [
    #inputs.nixvim.packages.${pkgs.system}.default
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
}
