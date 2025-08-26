{ config, lib, pkgs, modulesPath, ... }:

{

  boot.kernelPackages = pkgs.linuxPackages_latest;
  #boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_16;
}
