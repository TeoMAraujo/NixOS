{
  description = "Config do 'Teu Pai'";

  inputs = {
https://oliverkovacs.dev/blog/2025/05/02/installing-vivado-on-nixos.html
    stylix.url = "github:nix-community/stylix"
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
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
          nvf.nixosModules.default
          ./nvf.nix
        ];
      };
      homeConfigurations.paula = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs; };
        modules = [
          ./default/home.nix
          catppuccin.homeModules.catppuccin
https://www.youtube.com/watch?v=ljHkWgBaQWU
        ];
      };
    };
}
