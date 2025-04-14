{ config, pkgs, inputs, ... }:

{
# User config
    # Define a user account. Don't forget to set a password with ‘passwd’.
        users.users.paula = {
            isNormalUser = true;
            description = "paula";
            extraGroups = [ "networkmanager" "wheel" ];
            packages = with pkgs; [
            ];
        };
        networking.hostName = "nixos"; # Define your hostname.

# Enable the KDE Plasma Desktop Environment.
    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;

# Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

# Enable CUPS to print documents.
    services.printing.enable = true;

# Hardware
    # Enable sound with pipewire.
        hardware.pulseaudio.enable = false;
        security.rtkit.enable = true;
        services.pipewire = {
            enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;
            jack.enable = true;
        };
    # Enable networking
        networking.networkmanager.enable = true;

    # Enable touchpad support (enabled default in most desktopManager).
        services.xserver.libinput.enable = true;

# Theme
    catppuccin.flavor = "mocha";
    catppuccin.enable = true;

    system.stateVersion = "24.11";
}
