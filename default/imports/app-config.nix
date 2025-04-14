{ config, pkgs, ... }:

{

    programs.bash.shellAliases = {
        rSnos = "sudo nixos-rebuild switch --flake ~/NixOS/";
        rShm = "sudo home-manager switch --flake ~/NixOS/home-manager/";
    }
# autocpufreq
    services.auto-cpufreq = {
      enable = false;
      settings = {
        battery = {
          governor = "powersave";
          turbo = "never";
        };
        charger = {
          governor = "performance";
          turbo = "auto";
        };
      };
    };
# TLP
    services.power-profiles-daemon.enable = false;
    services.tlp = {
        enable = true;
        settings = {
            # profile
            CPU_SCALING_GOVERNOR_ON_AC = "performance";
            CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

            CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
            CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

            CPU_MIN_PERF_ON_AC = 20;
            CPU_MAX_PERF_ON_AC = 100;
            CPU_MIN_PERF_ON_BAT = 0;
            CPU_MAX_PERF_ON_BAT = 20;

            # Optional helps save long term battery health
            START_CHARGE_THRESH_BAT0 = 90;
            STOP_CHARGE_THRESH_BAT0 = 100;
            # se tiver esquentando
                # TLP_DEFAULT_MODE = "BAT";
                # TLP_PERSISTENT_DEFAULT = 1;
        };
    };
# Starship
    programs.starship = {
        enable = true;
        settings = {
            nix_shell = {
            symbol = " ";
            heuristic = false;
            };
            add_newline = true;
            "$schema" = "https://starship.rs/config-schema.json";
           character = {
                success_symbol = "[[󰄛](green) ❯](peach)";
                error_symbol = "[[󰄛](red) ❯](peach)";
                vimcmd_symbol = "[󰄛 ❮](subtext1)" ;
            };
            git_branch = {
                style = "bold mauve";
            };
            directory = {
                truncation_length = 4;
                style = "bold lavender";
            };
            os.disabled = true;
            palette = "catppuccin_mocha";
            palettes.catppuccin_mocha = {
                rosewater = "#f5e0dc";
                flamingo = "#f2cdcd";
                pink = "#f5c2e7";
                mauve = "#cba6f7";
                red = "#f38ba8";
                maroon = "#eba0ac";
                peach = "#fab387";
                yellow = "#f9e2af";
                green = "#a6e3a1";
                teal = "#94e2d5";
                sky = "#89dceb";
                sapphire = "#74c7ec";
                blue = "#89b4fa";
                lavender = "#b4befe";
                text = "#cdd6f4";
                subtext1 = "#bac2de";
                subtext0 = "#a6adc8";
                overlay2 = "#9399b2";
                overlay1 = "#7f849c";
                overlay0 = "#6c7086";
                surface2 = "#585b70";
                surface1 = "#45475a";
                surface0 = "#313244";
                base = "#1e1e2e";
                mantle = "#181825";
                crust = "#11111b";
            };
        };
    };
}
