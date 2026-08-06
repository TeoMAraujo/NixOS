# This file contains archived/unused configurations
# These settings are kept for reference and can be re-enabled if needed
# Last updated: 2025-04

{
  # ============================================================================
  # AUTO CPU FREQ - Previously used for CPU frequency scaling
  # Disabled in favor of TLP service
  # ============================================================================
  # autocpufreq-config = {
  #   services.auto-cpufreq = {
  #     enable = false;
  #     settings = {
  #       battery = {
  #         governor = "powersave";
  #         turbo = "never";
  #       };
  #       charger = {
  #         governor = "performance";
  #         turbo = "auto";
  #         enable_thresholds = true;
  #         start_threshold = 0;
  #         stop_threshold = 85;
  #       };
  #     };
  #   };
  # };

  # ============================================================================
  # RUST ANALYZER - LSP for Rust development
  # Commented out - can be re-enabled if Rust development is needed
  # ============================================================================
  # rust-analyzer-config = {
  #   plugins.lsp.servers.rust-analyzer = {
  #     enable = true;
  #     installCargo = true;
  #   };
  # };


}
