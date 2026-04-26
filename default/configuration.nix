{
  config,
  pkgs,
  inputs,
  system,
  ...
}:

let
  # 1. FIRMWARE: Lunar Lake SoundWire Topology (The Map)
  sof-lnl-topology = pkgs.stdenv.mkDerivation {
    name = "sof-lnl-topology";
    src = pkgs.fetchFromGitHub {
      owner = "thesofproject";
      repo = "sof-bin";
      rev = "main";
      sha256 = "sha256-iTUvRPUg10xkITM4vTzEx/aCImDcvYH2gorWRPX6DK4=";
    };
    installPhase = ''
      mkdir -p $out/lib/firmware/intel/sof-ipc4-tplg
      find . -type f -name "sof-lnl-*.tplg" -exec cp -v {} $out/lib/firmware/intel/sof-ipc4-tplg/ \;
    '';
  };

  # 2. UCM CONFIG: Download the text files only (The Manual)
  # We download this as a simple folder, NOT a package, to avoid build errors.
  alsa-ucm-files = pkgs.fetchFromGitHub {
    owner = "alsa-project";
    repo = "alsa-ucm-conf";
    rev = "master";
    sha256 = "sha256-Vds79ITUSZOqg4yf/dnYu2muxrvJuYBpvrtde/7+m9Y=";
  };
in
{
  imports = [
    ./imports/hardware-configuration.nix
    ./imports/app-config.nix
    ./imports/regionalization.nix
    ./imports/system.nix
    ./imports/apps.nix
    ./imports/boot.nix
    inputs.home-manager.nixosModules.default
  ];

  # --- AUDIO FIX START ---

  # A. Point Audio System to New Config Files
  # Instead of installing a new package, we just tell the system:
  # "Read your audio configuration from this downloaded folder."
  environment.variables.ALSA_CONFIG_UCM2 = "${alsa-ucm-files}/ucm2";

  # B. Inject the Firmware
  hardware.enableAllFirmware = true;
  hardware.firmware = [
    pkgs.sof-firmware
    sof-lnl-topology
  ];

  # C. Standard PipeWire Config
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  # --- AUDIO FIX END ---

  # Home-Manager
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "paula" = import ./home.nix;
    };
  };

  # Features
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nixpkgs.config.allowUnfree = true;
}
