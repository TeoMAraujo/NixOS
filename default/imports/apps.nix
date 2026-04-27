{
  config,
  pkgs,
  inputs,
  system,
  ...
}:

{
  imports = [
    ./programs
  ];

  # Programs
  environment.systemPackages = with pkgs; [
    #apps
    kicad
    google-chrome
    unrar
    jdk
    obsidian # flexible file and text manager
    notion-app-enhanced
    github-desktop
    krita # image editor
    davinci-resolve # video editor
    nomacs # image viewer
    amarok # music player
    vlc # video player
    kdePackages.dolphin # file manager
    anki
    #social
    whatsapp-for-linux # zap com eletron kk
    discord
    spotify # music
    #tools
    kdePackages.kwallet
    gparted # disk manager
    #ventoy-full # bootable iso's

    # programming tools
    vscode
    #kicad-unstable
    quartus-prime-lite
    R
    # rstudio
    logisim # logic gate sim
    #        onshape
    valgrind # memory leaks app
    inputs.nixvim.packages.${pkgs.system}.default # NixVim
    tmux
    libgccjit
    libgcc
    starship # prompt for shell
    neofetch
    kitty # terminal emulator
    bash
    doxygen
    doxygen_gui
    # services
    git
    zip
    unzip
    spicetify-cli # spotify cli
    home-manager
    catppuccin-whiskers
    justbuild
    kdePackages.ark # archive manager
    gnumake
  ];

  programs.firefox.enable = true;
}
