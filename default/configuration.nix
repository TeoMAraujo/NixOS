{ config, pkgs, inputs, ... }:

{
    imports =
    [ # include the results of the hardware scan.
        ./imports/hardware-configuration.nix
        ./imports/app-config.nix
        ./imports/regionalization.nix
        ./imports/system.nix
        ./imports/apps.nix
        inputs.home-manager.nixosModules.default
    ];

# Home-Manager
    home-manager = {
        # also pass inputs to home-manager modules
        extraSpecialArgs = {inherit inputs;};
        users = {
            "paula" = import ./home.nix;
        };
    };

# features
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nixpkgs.config.allowUnfree = true;
}
