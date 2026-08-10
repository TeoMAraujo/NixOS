# hosts/zenbook-s14/hardware.nix
{ config, lib, pkgs, ... }:

{
  # ---------------------------------------------------------------
  # Firmware
  # ---------------------------------------------------------------
  # enableAllFirmware já implica enableRedistributableFirmware.
  # Requer nixpkgs.config.allowUnfree = true;
  hardware.enableAllFirmware = true;

  # ---------------------------------------------------------------
  # Gráficos (Lunar Lake / Xe2, driver "xe")
  # ---------------------------------------------------------------
  hardware.graphics = {
    enable = true;
    enable32Bit = true; # só necessário para Steam / apps 32-bit
    extraPackages = with pkgs; [
      intel-media-driver # iHD, Broadwell+
      libvdpau-va-gl
    ];
  };
  environment.sessionVariables.LIBVA_DRIVER_NAME = "iHD";

  # ---------------------------------------------------------------
  # Serviços de hardware
  # ---------------------------------------------------------------
  services.fwupd.enable = true;
  hardware.bluetooth.enable = true;
  services.thermald.enable = true; # Intel: gerencia limites térmicos/potência

  # ---------------------------------------------------------------
  # Energia — TLP (exclui power-profiles-daemon)
  # ---------------------------------------------------------------
  services.power-profiles-daemon.enable = false;

  # powertop --auto-tune conflita com USB_AUTOSUSPEND do TLP.
  # Deixe desligado; ative só como experimento isolado.
  # powerManagement.powertop.enable = true;

  services.tlp = {
    enable = true;
    settings = {
      # ---- Operação e perfis (TLP 1.10+) ----
      TLP_ENABLE = 1;
      TLP_WARN_LEVEL = 3;
      TLP_AUTO_SWITCH = 2; # "smart": respeita troca manual
      TLP_PROFILE_AC = "BAL"; # PRF | BAL | SAV
      TLP_PROFILE_BAT = "SAV";
      TLP_PROFILE_DEFAULT = "BAL";

      # ---- CPU: intel_pstate em modo active ----
      # Confirmado no hardware: governors = performance powersave
      CPU_DRIVER_OPMODE_ON_AC = "active";
      CPU_DRIVER_OPMODE_ON_BAT = "active";

      # "powersave" NÃO limita desempenho; delega as decisões ao HWP.
      CPU_SCALING_GOVERNOR_ON_AC = "powersave";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      CPU_SCALING_GOVERNOR_ON_SAV = "powersave";

      # EPP é o lever real com HWP ativo.
      CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";
      CPU_ENERGY_PERF_POLICY_ON_SAV = "power";

      # Turbo mantido: race-to-idle.
      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 1;
      CPU_BOOST_ON_SAV = 0;

      CPU_HWP_DYN_BOOST_ON_AC = 1;
      CPU_HWP_DYN_BOOST_ON_BAT = 0;
      CPU_HWP_DYN_BOOST_ON_SAV = 0;

      # Sem CPU_MIN/MAX_PERF nem CPU_SCALING_*_FREQ:
      # cap de frequência é redundante com EPP e prejudica race-to-idle.

      # ---- Platform profile (asus-nb-wmi) ----
      # Confirmado no hardware: quiet balanced performance
      PLATFORM_PROFILE_ON_AC = "balanced";
      PLATFORM_PROFILE_ON_BAT = "quiet";
      PLATFORM_PROFILE_ON_SAV = "quiet";

      # ---- GPU Intel (driver xe; requer TLP 1.10 + kernel 6.18) ----
      INTEL_GPU_POWER_PROFILE_ON_AC = "base";
      INTEL_GPU_POWER_PROFILE_ON_BAT = "base";
      INTEL_GPU_POWER_PROFILE_ON_SAV = "power_saving";

      # ---- PCIe / runtime PM ----
      # "default" é o valor recomendado pela documentação.
      # "performance" pode AUMENTAR consumo (bloqueia C-states profundos).
      PCIE_ASPM_ON_AC = "default";
      PCIE_ASPM_ON_BAT = "default";
      RUNTIME_PM_ON_AC = "on";
      RUNTIME_PM_ON_BAT = "auto";

      # ---- USB ----
      USB_AUTOSUSPEND = 1;
      USB_EXCLUDE_AUDIO = 1;
      USB_EXCLUDE_BTUSB = 1; # padrão é 0; evita quedas de Bluetooth
      USB_EXCLUDE_PHONE = 1;
      USB_EXCLUDE_PRINTER = 1;

      # ---- Áudio (timeout em segundos, não booleano) ----
      SOUND_POWER_SAVE_ON_AC = 1;
      SOUND_POWER_SAVE_ON_BAT = 1;
      SOUND_POWER_SAVE_CONTROLLER = "Y";

      # ---- Rede ----
      WIFI_PWR_ON_AC = "off";
      WIFI_PWR_ON_BAT = "on"; # "on" = economia LIGADA
      WOL_DISABLE = "Y"; # inócuo: sem porta ethernet

      # ---- Kernel ----
      NMI_WATCHDOG = 0;

      # ---- Bateria (plugin asus: só stop threshold) ----
      START_CHARGE_THRESH_BAT0 = 0; # dummy obrigatório
      STOP_CHARGE_THRESH_BAT0 = 80; # 40/60/80 são os valores seguros
      RESTORE_THRESHOLDS_ON_BAT = 1;
    };
  };
}
