{
  description = "Config do 'Teu Pai'";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    catppuccin.url = "github:catppuccin/nix";
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixvim = {
      url = "github:TeoMAraujo/NixVim";
      #url = "github:nix-community/nixvim";
      #inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      self,
      nixpkgs,
      catppuccin,
      nixvim,
      ...
    }@inputs:
    # use "nixos", or your hostname as the name of the configuration
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./default/configuration.nix
          catppuccin.nixosModules.catppuccin
        ];
      };
    };
}
