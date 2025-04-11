{
  catppuccin = {
    enable = true;
    settings = {
    # Colors 
      flavour = "mocha";
      term_colors = true; # sets terminal colors (e.g. `g:terminal_color_0`)
      color_overrides = {};
      custom_highlights = {};
    
    # Font
      no_bold = false;
      no_italic = false;
      no_underline = false;
      styles = { # # Handles the styles of general hi groups (see `:h highlight-args`):
            comments = ["italic"]; 
            conditionals = ["italic"];
            loops = ["italic"];
            #functions = "";
            keywords = ["bold"];
           # strings = "";
         #   variables = "";
          #  numbers = "";
          #  booleans = "";
            #properties = "";
            types = ["bold"];
            #operators = "";
            # miscs = {}; # Uncomment to turn off hard-coded styles
      };
         
    # Intergrations
      default_integrations = true;
      integrations = {
            cmp = true;
            gitsigns = true;
            nvimtree = true;
            treesitter = true;
            notify = false;
            mini = {
                enabled = true;
                indentscope_color = "";  
         };
    }; ## For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)

    # Background
      background = { # :h background
         light = "latte";
         dark = "mocha";
      };
        
    transparent_background = false; # disables setting the background color.
    show_end_of_buffer = false; # shows the '~' characters after the end of buffers
    dim_inactive = {
        enabled = false; # dims the background color of inactive window
        shade = "dark";
        percentage = 0.15; # percentage of the shade to apply to the inactive window
     }; 
    };
## vim.cmd.colorscheme "catppuccin"
};
}
