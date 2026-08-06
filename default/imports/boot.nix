{
  pkgs,
  ...
}:

{
  boot.kernelPackages = pkgs.linuxPackages_latest;
  #boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_16;

  boot.kernelParams = [
    "acpi_backlight=native"
  ];

  # Bootloader
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
      useOSProber = true; # caso dê BO no windows olhar isso
      # REMOVED: extraConfig = "acpi /ssdt-csc3551.aml";
      # REASON: That file is for older Zenbooks. It breaks Lunar Lake audio.
    };
  };
    boot.loader.efi.efiSysMountPoint = "/boot";
}
