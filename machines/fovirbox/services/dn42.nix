{
  pkgs,
  lib,
  ...
}: {
  systemd.network.enable = lib.mkForce false;
  networking.useNetworkd = lib.mkForce false;

  services.dn42 = {
    enable = true;

    asn = 4242421984;
    ownIP = "172.21.118.148";
    ownIPv6 = "fdee:6aaa:01d9::2";
    ownNet = "172.21.118.128/27";
    ownNetv6 = "fdee:6aaa:1d9::/48";

    # Public key
    # FF8RToyzmth70AlHotfvetPEVsKJ+1rZHPMaXrCqqwI=
    privateKeyFile = "${pkgs.writeText "private-key" "${import ../values/dn42-private-key.nix}"}";

    peers = {
      fovir2 = {
        wg = {
          listenPort = 40000;
          publicKey = "wJmYG6HDXp+sYXniz7VDPkzZ8AKZxMiG39jDLKwmggA=";
          endpoint = import ../values/dn42-fovir2-endpoint.nix;
          linkLocal = "fe80::1/64";
          remoteV4 = "172.21.118.146";
          remoteV6 = "fdee:6aaa:01d9::3";
        };
        bgp = {
          remoteAs = 4242421984;
          neighborLinkLocal = "fe80::2";
        };
      };
    };
  };
}
