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

  # --- AUDIO CONFIGURATION (FIXED) ---

  # 1. Firmware: Essential for Intel Lunar Lake audio
  hardware.enableAllFirmware = true;
  hardware.firmware = [ pkgs.sof-firmware ];

  # 2. Disable Legacy PulseAudio (CRITICAL: conflicts with Pipewire)
  hardware.pulseaudio.enable = false;

  # 3. Enable PipeWire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true; # PipeWire replaces PulseAudio here
    jack.enable = true;
  };

  # --- END AUDIO CONFIGURATION ---

  # Networking
  networking.networkmanager.enable = true;

  # Input
  services.xserver.libinput.enable = true;

  # Theme
  catppuccin.flavor = "mocha";
  catppuccin.enable = true;

  system.stateVersion = "25.05";
}
