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

    peers = let
      linkLocal = "fe80::1984/64";
    in {
      AS20003 = {
        wg = {
          listenPort = 20003;
          publicKey = "rE4mEBQo2Z/kLkg7a89bSLN76asevkqA7GygPJfv5D8=";
          endpoint = import ../values/dn42-AS20003-endpoint.nix;
          linkLocal = linkLocal;
          remoteV4 = "172.20.192.3";
          remoteV6 = "fd25:5547:5a89::3";
        };
        bgp = {
          remoteAs = 4242420003;
          neighborLinkLocal = "fe80::9334";
        };
      };
      AS20728 = {
        wg = {
          listenPort = 20728;
          publicKey = "rxVEiqcS4UseSPlLyHI716WRKOWgKp3QtTWXs/2FdGw=";
          endpoint = import ../values/dn42-AS20728-endpoint.nix;
          linkLocal = linkLocal;
          remoteV4 = "172.22.106.29";
          remoteV6 = "fd38:8b09:eb92::29";
        };
        bgp = {
          remoteAs = 4242420728;
          neighborLinkLocal = "fe80::0728";
        };
      };
      fovir2 = {
        wg = {
          listenPort = 40000;
          publicKey = "wJmYG6HDXp+sYXniz7VDPkzZ8AKZxMiG39jDLKwmggA=";
          endpoint = import ../values/dn42-fovir2-endpoint.nix;
          linkLocal = "fe80::100/64";
          remoteV4 = "172.21.118.146";
          remoteV6 = "fdee:6aaa:01d9::3";
        };
        bgp = {
          remoteAs = 4242421984;
          neighborLinkLocal = "fe80::200";
        };
      };
    };
  };
}
