{
  description = "Nixos config flake";


   # home-manager.nixosModules.home-manager {
             # home-manager.useGlobalPkgs = true;
             # home-manager.useUserPackages = true;
             # home-manager.users.mike = {
             #   imports = [ ./hosts/MAIN/home.nix ];

            #  };
           # }
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:TeoMAraujo/NixVim";
      inputs.nixpkgs.follows = "nixpkgs";
    };# If using a stable channel you can use `url = "github:nix-community/nixvim/nixos<version>"`
  };

  outputs = { self, nixpkgs, ... }@inputs:
    # use "nixos", or your hostname as the name of the configuration
    # it's a better practice than "default" shown in the video
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
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./default/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
    };
}
