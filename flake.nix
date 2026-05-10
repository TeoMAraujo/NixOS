{
  description = "Config do 'Teu Pai'";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #   nixvim = {
      #url = "github:TeoMAraujo/NixVim";
      #url = "github:nix-community/nixvim";
      #inputs.nixpkgs.follows = "nixpkgs";
    catppuccin.url = "github:catppuccin/nix";
    flake-parts.url = "github:hercules-ci/flake-parts";
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      catppuccin,
       # nixvim,
      nvf,
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
      homeConfigurations.paula = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs; };
        modules = [
          ./default/home.nix
          ./nvf.nix
          catppuccin.homeModules.catppuccin
        ];
      };
    };
}
