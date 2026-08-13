{ config, pkgs, ... }:

{
  programs.bash.enable = true;
  programs.bash.shellAliases = {
    rSnos = "sudo nixos-rebuild switch --flake ~/github/NixOS/";
    rShm = "sudo home-manager switch --flake ~/NixOS/home-manager/";
    rSboot = "sudo nixos-rebuild boot --flake ~/github/NixOS/";
    rflake = "sudo nix flake update --flake ~/github/NixOS/";
    logisim = "cd Downloads/ && java -jar logisim-generic-2.7.1.jar";
    rars = "cd Downloads/ && java -Dsun.java2d.uiScale=2.0 -jar rars1_6.jar";
  };
}
