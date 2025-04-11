{
  plugins.colorizer = {
    enable = true;
    settings = {
      filetypes = {
        __unkeyed-1 = "css";
        __unkeyed-2 = "javascript";
        __unkeyed-3 = "nix";
        __unkeyed-4 = "html";
      };
      user_commands = [
        "ColorizerToggle"
        "ColorizerReloadAllBuffers"
      ];
      user_default_options = {
        mode = "virtualtext";
        names = false;
        virtualtext = "■ ";
      };
    };
  };
}
