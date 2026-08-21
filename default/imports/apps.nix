{
  config,
  pkgs,
  inputs,
  system,
  ...
}:
{
nixpkgs.config = {
  allowUnfree = true;
  permittedInsecurePackages = [ "ventoy-1.1.17" ];
};
    programs.firefox.enable = true;
    environment.systemPackages = with pkgs; [
    asusctl
    # Apps gráficos
    kicad              # PCB design
    ltspice            # SPICE
    krita              # editor de imagem
    davinci-resolve    # editor de vídeo
    nomacs             # visualizador de imagem
    vlc                # player de vídeo
    anki

# flatpackear:

    # Ferramentas do sistema
    gparted            # gerenciador de disco
    libqalculate               # calculadora CLI (verificar nome do pacote)
    brightnessctl
#services.blueman.enable = true
    # Programação
    libgccjit
    libgcc
#    make
    fastfetch

    # Aparência
    catppuccin-whiskers

    # Emuladores de terminal
    kitty

    # Shell
    starship           # prompt

    # Compactadores
    zip
    unzip
    rar
    unrar
    p7zip

    # Git
    git
    github-desktop
    # testa pra ver se fazem sentido de terem no pc
    # neovim
    # inputs.nixvim.packages.${pkgs.system}.default
    # pix
    # gawk             # awk correto no nixpkgs
    # miller           # mlr — manipula CSV
    # yazi             # gerenciador de arquivos
    # btop
    # htop
    # killall
    # logisim
    # valgrind
    # justbuild
    # quartus-prime-lite
    # networkmanagerapplet
    # tlp-pd
    # nvtopPackages.intel
    # wireshark
    # tshark
    # mars-mips
    # rars
    # jflap
    # kdePackages.kcalc
    # cava
    # prismlauncher
    # google-chrome
    # amarok           # player de música
    # mcomix
    # quickemu
    # spice
    # obsidian
    # pixelorama
    # OrcaSlicer
    # freecad
    # MeshLab
    # discord
    # spotify
    # spicetify-cli
    # claude-code
    # pavucontrol
    # distrobox
    # CLI — manipulação de texto/dados
    fzf
    # vim
    # tldr
    # wezterm
    # CLI — substituições modernas
    # zoxide           # substituto do cd
    # eza              # substituto do ls / tree
    # bat              # substituto do cat
    # ripgrep          # substituto do grep
    # curlie
    # gnumake
    # jdk
    # duf
    # dust
    # gh
    # delta
    # lazygit
    # doxygen
  ];
}
