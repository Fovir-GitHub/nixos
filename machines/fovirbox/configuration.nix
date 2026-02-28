{lib, ...}: let
  disk = "/dev/disk/by-path/virtio-pci-0000:00:07.0";
in {
  boot.kernelParams = ["zfs.zfs_arc_max=2147483648"];
  boot.loader.limine.biosDevice = lib.mkForce disk;
  disko.devices.disk.main.device = disk;
  networking.hostId = "00000000";
  services.openssh.ports = import ./values/ssh-port.nix;
  users.users.root = import ./values/user-root.nix;

  imports = [
    (import ../../modules/optional/fail2ban.nix {ignoreIP = import ./values/fail2ban-ignore-ip.nix;})
    ../../modules/optional/boot-loader/limine.nix
    ../../modules/optional/firewall.nix
    ../../modules/optional/kernels/xanmod.nix
    ../../modules/optional/virtualisation/podman.nix
    ../../modules/shared
    ./modules
    ./services
    ./values/encrypt.nix
  ];
}
