{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kitty-themes  # Adiciona os temas do Kitty, incluindo Catppuccin
  ];

  programs.kitty = {
    enable = true;
    themeFile = "${pkgs.kitty-themes}/share/kitty-themes/themes/Catppuccin-Mocha.conf";
    settings = {
      font_size = 10;
      background_opacity = 0.8;
      cursor_style = "beam";
      cursor_blink_interval = 500;
      cursor_underline_thickness = 2;
      cursor_stop_interval = 100;
      cursor_trail = 1;
      cursor_trail_decay = "0.1 0.5";

      # Customizações adicionais para o Kitty:
      # Fonte:
      # font_family = "JetBrains Mono";
      # font_size = 12;
      # font_features = "+ss01 +ss02";  # Ligaduras especiais
      
      # Abas:
      # tab_bar_edge = "top";  # ou "bottom"
      # tab_bar_style = "powerline";  # ou "fade", "slant", "separator"
      # tab_title_template = "{title}{' ≡ ' + str(num_windows) if num_windows > 1 else ''}";
      
      # Janelas:
      # window_border_width = 1;
      # window_padding_width = 5;
      # window_margin_width = 0;
      # draw_minimal_borders = true;  # Reduz bordas
      
      # Performance e visual:
      # animation_duration = 0.25;  # Velocidade de animações
      # confirm_os_window_close = 0;  # 0 = sem confirmação ao fechar
      # enable_audio_bell = false;  # Desabilita sino de áudio
      # visual_bell_duration = 0.0;  # Duração do flash visual
      
      # Comportamento do mouse:
      # mouse_hide_wait = 3;  # Esconde mouse após 3 segundos
      # url_style = "curly";  # ou "straight", "dotted", "dashed"
      # open_url_with = "firefox";  # Navegador padrão
      
      # Cores e aparência:
      # selection_background = "#404040";
      # selection_foreground = "#ffffff";
      # active_border_color = "#00ff00";
      # inactive_border_color = "#666666";
    };
    keybindings = {
      "ctrl+h" = "kitten neighboring_window left";
      "ctrl+l" = "kitten neighboring_window right";
    };
  };
}
