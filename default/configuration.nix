{ config, lib, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./imports/regionalization.nix
      ./imports/apps.nix
      ./imports/boot.nix
      ./imports/system.nix
    ];

}
