{
    description = "Config do 'Teu Pai'";
    
    inputs = {
        catppuccin.url = "github:catppuccin/nix"; 
        flake-parts.url = "github:hercules-ci/flake-parts";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nixvim = {
            url = "github:TeoMAraujo/NixVim";
            inputs.nixpkgs.follows = "nixpkgs";
        }; 
    };    

    outputs = { self, nixpkgs, home-manager, catppuccin, nixvim, ... }@inputs:
    # use "nixos", or your hostname as the name of the configuration
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
                catppuccin.nixosModules.catppuccin
                inputs.home-manager.nixosModules.default
            ];
        };
    };
}
