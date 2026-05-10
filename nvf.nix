# https://notashelf.github.io/nvf/options.html
{
config,
# hostname,
lib,
pkgs,
# username,
inputs,
...
}:
let
    inherit (config.programs.nvf) maxConfig;
in 
{
    imports = [
        ./NVF/keymaps.nix
        ./NVF/languages.nix
    ];

    config = {
        programs.nvf = {
            enable = true;
            settings.vim = {
                # Basic Settings
                viAlias = false;
                vimAlias = true;
                debugMode = {
                    enable = false;
                    level = 16;
                    logFile = "/tmp/nvim.log";
                };

                undoFile.enable = true;
                searchCase = "smart";

                # Editor Options
                options = {
                    cursorlineopt = "line";
                    shiftwidth = 4;
                    scrolloff = 4;
                    autoindent = true;
                    smartindent = true;
                    termguicolors = true;
                };

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
                        theme = "catppuccin";
                    };
                };

                # LSP and Code Intelligence
                lsp.enable = true;
                lsp = {
                    formatOnSave = false;
                    lspkind.enable = false;
                    lightbulb.enable = maxConfig;
                    lspsaga.enable = false;
                    trouble.enable = maxConfig;
                    lspSignature.enable = maxConfig;
                    otter-nvim.enable = true;
                    nvim-docs-view.enable = false;
                    presets = {
                        tailwindcss-language-server.enable = false;
                    };
                };

                diagnostics.config = {
                    underline.enable = true;
                    virtual_lines.enable = false;
                };

                treesitter.context.enable = maxConfig;

                # Editing Features
                autopairs.nvim-autopairs.enable = true;

                autocomplete.nvim-cmp = {
                    enable = true;
                };

                snippets.luasnip.enable = true;

                # UI Components
                filetree = {
                    neo-tree = {
                        enable = true;
                    };
                };

                tabline = {
                    nvimBufferline.enable = false;
                };

                telescope.enable = true;
                telescope.setupOpts.pickers.colorscheme.enable_preview = true;

                binds = {
                    whichKey.enable = false;
                    cheatsheet.enable = false;
                    hardtime-nvim = {
                        enable = false;
                        setupOpts = {
                            max_count = 5;
                            restriction_mode = "hint_and_block";
                        };
                    };
                };

                # UI Enhancements
                ui = {
                    borders.enable = false;
                    noice.enable = maxConfig;
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

                presence = {
                    neocord.enable = maxConfig;
                };

                # Version Control
                git = {
                    enable = false;
                    gitsigns.enable = true;
                    gitsigns.codeActions.enable = false;
                };

                # Terminal
                terminal = {
                    toggleterm = {
                        enable = true;
                        lazygit.enable = true;
                    };
                };

                # Comments and Text Manipulation
                comments = {
                    comment-nvim.enable = true;
                };

                mini = {
                    surround.enable = false;
                    colors.enable = false;
                };

                # Utilities
                utility = {
                    snacks-nvim.enable = maxConfig;
                    nix-develop.enable = maxConfig;
                    ccc.enable = false;
                    vim-wakatime.enable = false;
                    diffview-nvim.enable = true;
                    yanky-nvim = {
                        enable = false;
                        setupOpts.ring.storage = "sqlite";
                    };
                    icon-picker.enable = maxConfig;
                    surround = {
                        enable = true;
                        useVendoredKeybindings = false;
                    };
                    leetcode-nvim.enable = false;
                    multicursors.enable = true;
                    motion = {
                        hop.enable = maxConfig;
                        precognition.enable = false;
                    };
                    images = {
                        image-nvim.enable = false;
                    };
                };

                # Notes and Tasks
                notes = {
                    neorg = {
                        enable = false;
                        treesitter = {
                            norgPackage = pkgs.vimPlugins.nvim-treesitter.grammarToPlugin pkgs.tree-sitter-grammars.tree-sitter-norg;
                        };
                    };
                    orgmode.enable = false;
                    todo-comments.enable = true;
                };

                # AI Assistance
                assistant = {
                    chatgpt.enable = false;
                    copilot = {
                        enable = false;
                        cmp.enable = false;
                    };
                    codecompanion-nvim.enable = false;
                };

                # Other
                projects = {
                    project-nvim.enable = false;
                };

                gestures = {
                    gesture-nvim.enable = false;
                };

            };
            
        };

    };

    options = {
        programs.nvf.maxConfig = lib.mkEnableOption "Enable heavier nvf config"; # // { default = true; };
    };
}