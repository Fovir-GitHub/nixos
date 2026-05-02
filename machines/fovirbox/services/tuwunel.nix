{...}: {
  virtualisation.oci-containers.containers."tuwunel" = {
    image = "ghcr.io/matrix-construct/tuwunel:latest";

    environment = import ../values/tuwunel-env.nix;
    extraOptions = [
      "--cpus=0.5"
      "--memory=128m"
      "--memory-swap=128m"
    ];
    ports = ["127.0.0.1:2217:8008"];
    pull = "newer";
    volumes = ["${import ../values/podman-data-dir.nix}/tuwunel:/var/lib/tuwunel"];
  };
}
