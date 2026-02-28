{...}: {
  services.bird-lg = {
    frontend = {
      enable = true;
      domain = "";
      extraArgs = ["--trust-proxy-headers"];
      listenAddresses = "127.0.0.1:15000";
      netSpecificMode = "dn42";
      protocolFilter = ["bgp"];
      proxyPort = 18000;
      servers = import ../values/bird-lg-servers.nix;
    };
    proxy = {
      enable = true;
      listenAddresses = "127.0.0.1:18000";
    };
  };
}
