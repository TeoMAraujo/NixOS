{ lib, ... }:
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

        # Use strings em vez de blocos { appId = ... }
        packages = [
            "net.waterfox.waterfox"
            "com.stremio.Stremio"
            "md.obsidian.Obsidian" #discord
        ];

        overrides.global.Environment.TZ = ":/run/host/monitor/localtime";
    };
}
