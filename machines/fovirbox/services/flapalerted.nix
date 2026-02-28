{...}: {
  services.flapalerted = let
    asn = 4242421984;
    bgpPort = 1790;
  in {
    enable = true;

    settings = {
      asn = asn;
      bgpListenAddress = "127.0.0.1:${toString bgpPort}";
      httpAPIListenAddress = "127.0.0.1:8085";
      routeChangeCounter = 120;
      overThresholdTarget = 5;
      underThresholdTarget = 30;
    };
    birdConfig = ''
      protocol bgp flapalerted {
        local as ${toString asn};
        neighbor 127.0.0.1 as ${toString asn} port ${toString bgpPort};
        ipv4 {
          add paths on;
          export all;
          import none;
        };
        ipv6 {
          add paths on;
          export all;
          import none;
        };
      }
    '';
  };
}
