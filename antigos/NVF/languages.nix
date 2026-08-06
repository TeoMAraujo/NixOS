{ config, lib, ... }:
let
    inherit (config.programs.nvf) maxConfig;
in
{

config.programs.nvf.settings.vim.languages = {
    enableFormat = false;
    enableTreesitter = true;
    enableExtraDiagnostics = true;

    # Languages.
    nix = {
        enable = true;
        extraDiagnostics.enable = true;
        treesitter.enable = true;
        format.type = [ "alejandra" ];
        lsp = {
            servers = [ "nixd" ];
            # package = pkgs.nixd;
        };
    };

    java.enable = maxConfig;
    csharp.enable = maxConfig;
    python.enable = maxConfig;
    yaml.enable = true;
    dart.enable = false;

    markdown = {
        enable = true;
        extensions.render-markdown-nvim.enable = true;
    };

    lua.enable = maxConfig;
    bash.enable = true;

    clang = {
        enable = true;
        lsp.enable = true;
        treesitter.enable = true;
    };

    css.enable = maxConfig;
    html.enable = maxConfig;
    sql.enable = true;
    kotlin.enable = false;
    go.enable = true;
    zig.enable = false;
    typst.enable = false;
    rust = {
        enable = true;
        extensions.crates-nvim.enable = true;
    };

    # Language modules that are not as common.
    assembly.enable = true;
    astro.enable = false;
    nu.enable = false;
    julia.enable = false;
    vala.enable = false;
    scala.enable = false;
    r.enable = false;
    gleam.enable = false;
    ocaml.enable = false;
    elixir.enable = false;
    haskell.enable = false;
    ruby.enable = false;
    fsharp.enable = false;

};

}
