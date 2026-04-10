{inputs, ...}: {
  system.stateVersion = "26.05";

  imports = let
    username = "fovir";
  in [
    (import ../../modules/optional/desktop/sway {inherit username;})
    (import ./modules {inherit username;})
    ../../modules/optional/boot-loader/systemd-boot.nix
    ../../modules/optional/kernels/zen.nix
    ../../modules/optional/virtualisation/podman.nix
    ../../modules/optional/virtualisation/qemu.nix
    ../../modules/shared
    ./values/hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  boot = {
    kernelModules = ["amdgpu"];
    kernelParams = ["amdgpu" "resume_offset=0"];
    resumeDevice = "/dev/nvme0n1";
  };
  disko.devices.disk.main.device = "/dev/disk/by-path/pci-0000:05:00.0-nvme-1";
  networking = import ./values/networking.nix;
  programs.zsh.enable = true;
}
