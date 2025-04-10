{ config, pkgs, inputs, nixvim, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./app-config.nix
      ./regionalization.nix
      inputs.home-manager.nixosModules.default
    ];
# Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

# features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

# Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.

# Enable networking
  networking.networkmanager.enable = true;

# Enable CUPS to print documents.
  services.printing.enable = true;

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

# Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;


# Battery optimization
  powerManagement.powertop.enable = true;
  services.thermald.enable = true;
  services.tlp.enable = true;

# Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.paula = {
    isNormalUser = true;
    description = "teo";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
  };

# Home-Manager
home-manager = {
  # also pass inputs to home-manager modules
  extraSpecialArgs = {inherit inputs;};
  users = {
    "paula" = import ./home.nix;
  };
};

# Programs
  environment.systemPackages = with pkgs; [
  #apps
    obsidian #flexible file and text manager
    spotify #music
    github-desktop
    krita #image editor
    davinci-resolve #video editor
    whatsapp-for-linux #zap kk
    discord

  #Default Aplications
    librewolf #browser
    thunderbird #email client
    nomacs #image viewer
    amarok #music player
    vlc #video player
    kdePackages.okular #PDF viewer
    kdePackages.dolphin #file manager
    ghostty #terminal emulator
    peazip #archive manager
  #tools
    kdePackages.kwallet
    gparted #disk manager
    ventoy-full #bootable iso's
    #simulators
    logisim #logic gate sim
    valgrind #memory leaks app
    # services
    git
    zip
    unzip
    starship #prompt for shell
    neofetch
    spicetify-cli #spotify cli
    home-manager
    catppuccin-whiskers
    justbuild
    vscode
    tmux
    libgccjit
    # inputs.nixvim.packages.${pkgs.system}.default
#    binutils
    libgcc
    (nixvim.legacyPackages."${pkgs.stdenv.hostPlatform.system}".makeNixvim {
      colorschemes.gruvbox.enable = true;
  })
  ];
  programs.firefox.enable = true;
  programs.bash.shellAliases = {
    rSnos = "sudo nixos-rebuild switch --flake ~/NixOS/";
    rShm = "sudo home-manager switch --flake ~/NixOS/home-manager/";
  };

  catppuccin.flavor = "mocha";
  catppuccin.enable = true;
  



  system.stateVersion = "24.11";
}
