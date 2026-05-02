{lib, ...}:
with lib; {
  environment.etc."resolv.conf" = mkForce {
    mode = "0644";
    text = ''
      # Managed by unbound
      nameserver 127.0.0.1
      nameserver ::1
    '';
  };

  networking = {
    dhcpcd.extraConfig = "nohook resolv.conf";
    firewall.enable = false;
    nameservers = [
      "127.0.0.1"
      "::1"
    ];
    networkmanager = {
      dns = "none";
      enable = true;
    };
    resolvconf.enable = false;
  };

  services.unbound = {
    enable = true;
    settings = {
      server = {
        do-ip4 = true;
        do-ip6 = true;
        do-tcp = true;
        do-udp = true;
        hide-identity = true;
        hide-version = true;
        interface = [
          "127.0.0.1"
          "::1"
          "192.168.122.1"
        ];
        access-control = [
          "127.0.0.0/8 allow"
          "::1/128 allow"
          "192.168.122.0/24 allow"
        ];
        num-threads = 2;
        prefetch = true;
        qname-minimisation = true;
        use-syslog = true;
        verbosity = 1;
      };
      forward-zone = [
        {
          forward-addr = import ../values/nameserver.nix;
          forward-tls-upstream = true;
          name = ".";
        }
      ];
    };
  };
}
