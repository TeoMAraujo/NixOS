let
  colors = import ./colors/catppuccin.nix;
in
{
  plugins = {
    web-devicons.enable = true;
    lualine = {
      enable = true;
      settings = {
        options = {
          globalstatus = true;
          component_separators = "";
          section_separators = {
            left = "";
            right = "";
          };
          theme = {
            normal = {
              a = {
                bg = "nil";
              };
              b = {
                bg = "nil";
              };
              c = {
                bg = "nil";
              };
              x = {
                bg = "nil";
              };
              y = {
                bg = "nil";
              };
              z = {
                bg = "nil";
              };
            };
          };
          disabled_filetypes = {
            statusline = [
              "dashboard"
              "alpha"
              "starter"
            ];
          };
        };
        sections = {
          lualine_a = [
            {
              __unkeyed.__raw = ''
                function()
                  return '▊'
                end
              '';
              color.fg = colors.base09;
              padding.right = 1;
            }
          ];
          lualine_b = [ "" ];
          lualine_c = [
            {
              __unkeyed = "mode";
              color.fg = colors.base08;
              separator.left = "";
              separator.right = "";
            }
            {
              __unkeyed = "location";
              color.fg = colors.base0F;
              separator.left = "";
              separator.right = "";
            }
            {
              __unkeyed = "filename";
              color.fg = colors.base09;
              separator.left = "";
              separator.right = "";
            }
          ];
          lualine_x = [
            {
              __unkeyed = "filetype";
              colored = true;
              icon_only = false;
              icon.align = "left";
              color.fg = colors.base0F;
              separator.left = "";
              separator.right = "";
            }
            {
              __unkeyed = "progress";
              color.fg = colors.base0F;
              separator.left = "";
              separator.right = "";
            }
            {
              __unkeyed = "branch";
              color.fg = colors.base08;
              separator.left = "";
              separator.right = "";
            }
          ];
          lualine_y = [ "" ];
          lualine_z = [
            {
              __unkeyed.__raw = ''
                function()
                  return '▊'
                end
              '';
              color.fg = colors.base09;
              padding.left = 1;
            }
          ];
        };
      };
    };
  };
}
