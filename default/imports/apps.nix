{ config, pkgs, inputs, ... }:

{
    imports =
    [ # include the results of the hardware scan.
        ./app-config.nix
    ];

# Programs
    environment.systemPackages = with pkgs; [
    #apps
        obsidian #flexible file and text manager
        desktop
        krita #image editor
        davinci-resolve #video editor
        nomacs #image viewer
        amarok #music player
        vlc #video player
        kdePackages.dolphin #file manager

    #social
        whatsapp-for-linux #zap com eletron kk
        discord 
        spotify #music

    #tools
        kdePackages.kwallet
        gparted #disk manager
        ventoy-full #bootable iso's
    
    # programming tools
        logisim #logic gate sim
        valgrind #memory leaks app
        inputs.nixvim.packages.${pkgs.system}.default # NixVim
        tmux
        libgccjit 
        libgcc 
        starship #prompt for shell
        neofetch 
        ghostty #terminal emulator
        bash

    # services
        git
        zip
        unzip
        spicetify-cli #spotify cli
        home-manager
        catppuccin-whiskers
        justbuild   
        ark #archive manager
    ];
    
    # Battery optimization
        powerManagement.powertop.enable = true;
        services.thermald.enable = true;
        services.tlp.enable = true;

    programs.firefox.enable = true;
}
