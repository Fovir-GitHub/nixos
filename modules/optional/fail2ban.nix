{ignoreIP}: {pkgs, ...}: {
  services = {
    openssh.settings.LogLevel = "VERBOSE";

    fail2ban = {
      enable = true;

      # From https://discourse.nixos.org/t/fail2ban-is-not-working-for-sshd-with-systemd-backend/48972/2
      package = pkgs.fail2ban.overrideAttrs (_old: {
        patches = [
          (pkgs.fetchpatch {
            url = "https://github.com/fail2ban/fail2ban/commit/2fed408c05ac5206b490368d94599869bd6a056d.patch";
            hash = "sha256-uyrCdcBm0QyA97IpHzuGfiQbSSvhGH6YaQluG5jVIiI=";
          })
          (pkgs.fetchpatch {
            url = "https://github.com/fail2ban/fail2ban/commit/50ff131a0fd8f54fdeb14b48353f842ee8ae8c1a.patch";
            hash = "sha256-YGsUPfQRRDVqhBl7LogEfY0JqpLNkwPjihWIjfGdtnQ=";
          })
        ];
      });

      maxretry = 5;
      ignoreIP =
        [
          "127.0.0.1"
          "::1"
        ]
        ++ ignoreIP;
      bantime = "300d"; # Ban IPs for one day on the first ban
      banaction = "nftables-multiport";
      bantime-increment = {
        enable = true; # Enable increment of bantime after each violation

        multipliers = "1 2 4 8 16 32 64";
        maxtime = "6000d"; # Do not ban for more than 1 week
        overalljails = true; # Calculate the bantime based on all the violations
      };

      jails = {
        sshd = {
          enabled = true;

          settings = {
            action = ''nftables-multiport[name=sshd, port="ssh", protocol=tcp]'';
            backend = "systemd";
            banaction = "nftables";
            filter = "sshd";
            mode = "aggressive";
          };
        };
      };
    };
  };
}
