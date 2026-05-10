{
  config,
  pkgs,
  inputs,
  system,
  ...
}:

{
  # Programs
  environment.systemPackages = with pkgs; [
    #apps
        kicad
        obsidian # flexible file and text manager
        notion-app-enhanced
        github-desktop
        krita # image editor
        davinci-resolve # video editor
        nomacs # image viewer
        amarok # music player
        vlc # video player
        kdePackages.dolphin # file managerer
        anki
    #social
        whatsapp-for-linux # zap com eletron kk
        discord
        spotify # music
        spicetify-cli # spotify cli
    
    #tools
        kdePackages.kwallet
        gparted # disk manager
        #ventoy-full # bootable iso's

    # programming tools
        kitty # terminal emulator
        vscode
        quartus-prime-lite
        # neovim # nvim editor
        # inputs.nixvim.packages.${pkgs.system}.default # NixVim
        tmux
        libgccjit
        libgcc
        starship # prompt for shell
        neofetch
        bash
        doxygen
        doxygen_gui
        
    # logisim # logic gate sim # onshape # valgrind # memory leaks app
    
    
    # services
        git
        zip
        unzip
        unrar
        home-manager
        catppuccin-whiskers
        justbuild
        kdePackages.ark # archive manager
        gnumake
        jdk
        
  ];

  programs.firefox.enable = true;
}
