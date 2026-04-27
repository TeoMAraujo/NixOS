{ config, pkgs, lib, ... }:

{
  services.power-profiles-daemon.enable = false;

  services.tlp = {
    enable = true;
    settings = {
      # CPU Scaling - Otimizado para Lunar Lake
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      # Energy Performance Preference (Intel P-states)
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

      # Frequency limits para bateria (Lunar Lake tem P-cores e E-cores)
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 60;  # Limita a 60% em bateria
      CPU_MIN_PERF_ON_AC = 20;
      CPU_MAX_PERF_ON_AC = 100;

      # Limiares de bateria - Mantém saúde da bateria
      START_CHARGE_THRESH_BAT0 = 75;
      STOP_CHARGE_THRESH_BAT0 = 85;

      # Turbo boost - Desabilita em bateria para economizar
      TURBO_PSTATE = "auto";

      # Wake on LAN desabilitado
      WOL_CMD = "disable";

      # USB autosuspend - Economiza energia
      USB_AUTOSUSPEND = 1;
      USB_AUTOSUSPEND_USBCORE = 1;

      # Discos
      DISK_SPINDOWN_TIMEOUT_ON_BAT = 20;
      DISK_IOPRIO = "3";  # lowest I/O priority

      # Wireless - Menos agressivo em bateria
      WIFI_PWR_ON_BAT = "on";

      # PCIe ASPM (Active State Power Management) - Muito efetivo em Lunar Lake
      PCIE_ASPM_ON_BAT = "powersupersave";
      PCIE_ASPM_ON_AC = "performance";

      # Runtime PM
      RUNTIME_PM_ON_BAT = "auto";
      RUNTIME_PM_BLACKLIST = "";
    };
  };

  # Intel thermald para gerenciar temperatura
  services.thermald.enable = true;
  
  # PowerTop para análise de consumo
  powerManagement.powertop.enable = true;

  # ASUS Daemon para controlar ventiladores e RGB (otimizado para Vivobook)
  services.asusd.enable = true;
  services.asusd.enableUserService = true;

  # Habilitar cpufreq para melhor controle
  powerManagement.cpuFreqGovernor = lib.mkDefault "ondemand";
}
