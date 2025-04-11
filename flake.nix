{
  description = "Nixos config flake";
   
   
   inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    catppuccin.url = "github:catppuccin/nix"; 
    nvf.url = "github:notashelf/nvf";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
 #   nixvim = {
  #    url = "github:TeoMAraujo/NixVim";
  #    inputs.nixpkgs.follows = "nixpkgs";
#    };# If using a stable channel you can use `url = "github:nix-community/nixvim/nixos<version>"`
  };
  outputs = { self, nixpkgs, home-manager, catppuccin, nvf, ... }@inputs:
    let
		system = "x86_64-linux";
		pkgs = nixpkgs.legacyPackages.${system};
	in
    {
      homeConfigurations."paula" =
        inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./default/home.nix ];
	};
	packages.x86_64-linux. default =
        (inputs.nvf.lib.neovimConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          modules = [./nvf-configuration.nix];
        }).neovim;

	legacyPackages
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./default/configuration.nix
          catppuccin.nixosModules.catppuccin
          inputs.home-manager.nixosModules.default
          nvf.nixosModules.default

        ];
      };
    };
}
