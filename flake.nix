{
  description = "Nixos config flake";


   inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    catppuccin.url = "github:catppuccin/nix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    }; 
    flake-parts.url = "github:hercules-ci/flake-parts";
        # If using a stable channel you can use `url = "github:nix-community/nixvim/nixos<version>"`
  };
  outputs = { self, nixpkgs, home-manager, catppuccin, nixvim, flake-parts, ... }@inputs:
    # use "nixos", or your hostname as the name of the configuration
    # it's a better practice than "default" shown in the video
    let
		system = "x86_64-linux";
		pkgs = nixpkgs.legacyPackages.${system};
        
        
            nixvimLib = nixvim.lib.${system};
            nixvim' = nixvim.legacyPackages.${system};
            nixvimModule = {
                inherit pkgs; # or alternatively, set `pkgs`
                module = import ./default/config; # import the module directly
                # You can use `extraSpecialArgs` to pass additional arguments to your module files
                extraSpecialArgs = {
              # inherit (inputs) foo;
                };
            };
            nvim = nixvim'.makeNixvimWithModule nixvimModule;
    in
    { 
          checks = {
            # Run `nix flake check .` to verify that your config is not broken
            default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
          };

          packages = {
            # Lets you run `nix run .` to start nixvim
            default = nvim;
          };
    
            
      homeConfigurations."paula" =
        inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./default/home.nix ];
	
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./default/configuration.nix
          catppuccin.nixosModules.catppuccin
          inputs.home-manager.nixosModules.default
        ];
      };
    };
};
}
