{
  description = "floquito";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    
    # flake-parts.url = "github:hercules-ci/flake-parts";
    
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";  
    };    
    nvf = {
        url = "github:notashelf/nvf";
        inputs.nixpkgs.follows = "nixpkgs"; # undouble versions
    };
    catppuccin = {
        url = "github:catppuccin/nix";
        inputs.nixpkgs.follows = "nixpkgs"; # undouble versions
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #     wstylix.url = "github:nix-community/stylix"; # https://www.youtube.com/watch?v=ljHkWgBaQWU
#     stylix.inputs.nixpkgs.follows = "nixpkgs";
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
    { self, nixpkgs, home-manager, catppuccin, nvf, nix-flatpak, spicetify-nix, ... }@inputs:
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; }; # puxa os inputs para ser acessado por outros arquivos
        modules = [
            ./default/configuration.nix
            ./home.nix
            home-manager.nixosModules.home-manager
            spicetify-nix.homeManagerModules.spicetify        
            #inputs.stylix.nixosModules.stylix
            catppuccin.nixosModules.catppuccin
            ./nvf.nix
            nvf.nixosModules.default
            spicetify-nix.nixosModules.default
            nix-flatpak.nixosModules.nix-flatpak
        ];
      };
    };
}
