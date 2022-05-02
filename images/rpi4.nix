{ lib, ... }: {
  imports = [
    ../modules/common.nix
  ];

  nixpkgs.localSystem = {
    config = "aarch64-unknown-linux-gnu";
    system = "aarch64-linux";
  };

  powerManagement.cpuFreqGovernor = lib.mkDefault "ondemand";

  networking.wireless.enable = false;

  hardware.pulseaudio.enable = false;

  documentation.enable = false;
}
