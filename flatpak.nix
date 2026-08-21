{ lib, self, ... }:
{
    services.flatpak = {
        enable = true;
        
        update.onActivation = true;
        uninstallUnmanaged = true;

        remotes = lib.mkOptionDefault [
            {
                name = "flathub";
                location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
            }
        ];

        packages = [
            { appId = "net.waterfox.waterfox"; origin = "flathub"; }
            { appId = "com.stremio.Stremio"; origin = "flathub"; }
            { appId = "md.obsidian.Obsidian"; origin = "flathub"; }
        ];

        overrides.global.Environment.TZ = ":/run/host/monitor/localtime";
    };
}
