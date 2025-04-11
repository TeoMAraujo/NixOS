{
  config = {
    performance = {
      byteCompileLua = {
        enable = true;
        nvimRuntime = true;
        configs = true;
        plugins = true;
      };
    };

    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };

    opts = {
      number = true;
      relativenumber = true;

      # Set tabs to 4 spaces
      tabstop = 4;
      softtabstop = 4;
      showtabline = 0;
      expandtab = true;

      # 2 spaces auto indent
      smartindent = true;
      shiftwidth = 4;

      # Text wrap
      wrap = true;

      foldenable = true;

      # Wrapped lines will continue visually indented
      breakindent = true;

      # Position of new buffers
      splitbelow = true;
      splitright = true;


      # Keeps at least 8 lines above/bellow cursor except on start/end
      scrolloff = 9;

      # Better searching
      ignorecase = true;
      smartcase = true;

      # Autosaving when nothing is typed after some milliseconds
      updatetime = 50000000;

      # Auto complete options
      completeopt = [
        "menuone" # Always shows the suggestion menu
        "noselect" # Disables auto select from suggestions
        "noinsert" # Disables auto insert suggestion
      ];

      # Enable persistent undo history
      swapfile = false;
      autoread = true;
      backup = false;
      undofile = true;

      # 24-bit colors
      termguicolors = true;

      # Mapped sequence timeout in milliseconds
      timeoutlen = 50;

      encoding = "utf-8";
      fileencoding = "utf-8";

      # More space in the command line for displaying messages
      cmdheight = 0;

      showmode = false;
    };
  };
}
