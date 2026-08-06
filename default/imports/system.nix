{
  config,
  pkgs,
  inputs,
  catppuccin
  ...
}:

{
  networking.hostName = "nixos";
  # User config
  users.users.paula = {
    isNormalUser = true; # create /home
    description = "paula";
    extraGroups = [
      "wheel" # sudo
      "networkmanager" # wifi without permission
    ];
    packages = with pkgs; [ ];
  };

  # Desktop Environment
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

#olhar webcam e especificações de hardware da asus
# criar o hardware e olhar os flakes
# https://linux-hardware.org/?view=howto -> precisa de flatpak ou docker
#como funfam os gerenciadores de pacotes distintos

# Audio
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Bluetooth
  hardware.bluetooth.enable = true; # bluetoothctl
  hardware.bluetooth.powerOnBoot = false;
  hardware.bluetooth.settings = {
    General = {
      Experimental = true; # IOs battery
    };
  };

  # Printing
  services.printing.enable = true; # VER SE PRECISA DE DRIVER ESPECIFICO

  # Networking
  networking.networkmanager.enable = true;

  # I/Os 
  services.libinput.enable = true; # da pra configurar mais 

  # Theme
  catppuccin.flavor = "mocha";
  catppuccin.enable = true;
 
  # Optimizations
    nix.settings.auto-optimise-store = true;
    hardware.enableRedistributableFirmware = true;
    services.fwupd.enable = true;   # atualizações de firmware





  # This option defines the first version of NixOS you have installed on this
  # particular machine, and is used to maintain compatibility with application
  # data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any
  # reason, even if you've upgraded your system to a new NixOS release.
  #
  # See `man configuration.nix` or
  # https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion
  system.stateVersion = "25.05"; # Did you read the comment?
}
