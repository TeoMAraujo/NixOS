{ pkgs, inputs, ... }: 
{
  programs.spicetify =
    let
      # Use the legacyPackages from the flake to access extensions and themes
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in
    {
      enable = true;
      
      # List of available extensions: https://github.com/Gerg-L/spicetify-nix?tab=readme-ov-file#extensions
      enabledExtensions = with spicePkgs.extensions; [
        adblock
        hidePodcasts
        shuffle
      ];
      
      # List of available custom apps: https://github.com/Gerg-L/spicetify-nix?tab=readme-ov-file#custom-apps
      enabledCustomApps = with spicePkgs.apps; [
        newReleases
        lyricsPlus
      ];

      # Setting the theme to Catppuccin Mocha to match your flake inputs
      theme = spicePkgs.themes.catppuccin;
      colorScheme = "mocha";
    };
}
