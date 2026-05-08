{...}: {
  virtualisation.oci-containers.containers."zeroclaw" = {
    image = "ghcr.io/zeroclaw-labs/zeroclaw:latest";
    # ports = ["127.0.0.1:42617:42617"];
    volumes = [
      "zeroclaw:/zeroclaw-data"
      "${../values/zeroclaw-conf.toml}:/zeroclaw-data/.zeroclaw/config.toml:ro"
    ];
  };
}
