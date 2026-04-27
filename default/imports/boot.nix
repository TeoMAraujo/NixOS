{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}:

{

  boot.kernelPackages = pkgs.linuxPackages_latest;
  #boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_16;

  # Suppress ACPI BIOS errors and TSC warnings during boot
  # These are firmware bugs in BIOS/UEFI, not system issues
  boot.kernelParams = [
    "acpi_backlight=native"
  ];
}
