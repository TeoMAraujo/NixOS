# Theme and Appearance Settings
{
config,
lib,
pkgs,
...
}:
let
    inherit (config.programs.nvf) maxConfig;
in
{
    config.programs.nvf.settings.vim = {
        # Theme and Appearance
        theme = {
            enable = true;
            name = "catppuccin";
            style = "mocha";
            transparent = true;
        };

        startPlugins = [
            "catppuccin"
        ];

        visuals = {
            nvim-scrollbar.enable = false;
            nvim-web-devicons.enable = true;
            nvim-cursorline.enable = true;
            cinnamon-nvim.enable = true;
            fidget-nvim.enable = maxConfig;
            highlight-undo.enable = true;
            indent-blankline.enable = true;
        };

        statusline = {
            lualine = {
                enable = true;
                theme = "auto";
            };
        };

        ui = {
            borders.enable = false;
            noice = {
                enable = maxConfig;
                setupOpts.presets.lsp_doc_border = true;
            };
            colorizer.enable = true;
            modes-nvim.enable = false;
            illuminate.enable = true;
            breadcrumbs = {
                enable = maxConfig;
                navbuddy.enable = maxConfig;
            };
            smartcolumn = {
                enable = false;
                setupOpts.custom_colorcolumn = {
                    nix = "110";
                    ruby = "120";
                    java = "130";
                    go = [
                        "90"
                        "130"
                    ];
                };
            };
            fastaction.enable = true;
        };

        # Views and Utilities
        dashboard = {
            dashboard-nvim.enable = false;
            alpha.enable = maxConfig;
        };

        minimap = {
            minimap-vim.enable = false;
            codewindow.enable = maxConfig;
        };

        # Notifications and Feedback
        notify = {
            nvim-notify.enable = maxConfig;
        };

        telescope = {
            enable = true;
            setupOpts = {
                pickers.colorscheme.enable_preview = true;
            };
        };
    };
}
