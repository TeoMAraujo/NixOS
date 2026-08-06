{
  description = "floquito";

  inputs =
    let
      follow = {
        inputs.nixpkgs.follows = "nixpkgs"; # undouble versions
      };
    in
    {
      nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    # flake-parts.url = "github:hercules-ci/flake-parts";
      nvf = (follow // { url = "github:notashelf/nvf"; });
      catppuccin = (follow // { url = "github:catppuccin/nix"; });
#     stylix = (follow // { url = "github:nix-community/stylix"; }); # https://www.youtube.com/watch?v=ljHkWgBaQWU
#  nix-flatpak = (follow // {url = "github:gmodena/nix-flatpak/?ref=latest"});
    #   nixos-hardware = {
#   url = "github:NixOS/nixos-hardware/master";
#     };
#     nixpkgs = {
#       url = "github:nixos/nixpkgs/nixos-25.11";
#     };
#     nixpkgs-master = {
#       url = "github:nixos/nixpkgs/master";
#     };
#     nixpkgs-unstable = {
#       url = "github:nixos/nixpkgs/nixos-unstable";
#     };
#     utils = {
#       url = "github:numtide/flake-utils";
#     };
    };
# https://github.com/Misterio77/nix-colors
  outputs =
    { self, nixpkgs, catppuccin, nvf, ... }@inputs:
    {
      nixosConfigurations.paula = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; }; # puxa os inputs para ser acessado por outros arquivos
        modules = [
          ./default/configuration.nix
            #inputs.stylix.nixosModules.stylix
          catppuccin.nixosModules.catppuccin
          # nvf.nixosModules.default
          ./nvf.nix
          # nix-flatpak.nixosModules.nix-flatpak
        ];
      };
    };
}
