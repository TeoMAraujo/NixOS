{
  config,
  pkgs,
  inputs,
  ...
}:

{
  # User config
  users.users.paula = {
    isNormalUser = true;
    description = "paula";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [ ];
  };

  networking.hostName = "nixos";

  # Desktop Environment
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Bootloader
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
      useOSProber = true;
      # REMOVED: extraConfig = "acpi /ssdt-csc3551.aml";
      # REASON: That file is for older Zenbooks. It breaks Lunar Lake audio.
    };
  };

  # Printing
  services.printing.enable = true;

  # Networking
  networking.networkmanager.enable = true;

  # Input
  services.libinput.enable = true;

  # Theme
  catppuccin.flavor = "mocha";
  catppuccin.enable = true;

  system.stateVersion = "25.05"; # Latest stable
}
