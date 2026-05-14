{...}: {
  virtualisation.oci-containers.containers = {
    "elk" = {
      autoStart = true;
      image = "ghcr.io/fovir-github/elk:main";
      ports = ["127.0.0.1:1111:5314"];
      pull = "newer";
      user = "911:911";
      volumes = ["${import ../values/podman-data-dir.nix}/elk:/elk/data"];
    };
    # "fe" = {
    #   image = "ghcr.io/fovir-github/masto-fe-standalone:latest";
    #   ports = ["127.0.0.1:1110:80"];
    #   pull = "always";
    # };
    "gotosocial" = {
      autoStart = true;
      environment = import ../values/gotosocial-env.nix;
      extraOptions = [
        "--cpus=0.5"
        "--memory=512m"
        "--memory-swap=512m"
      ];
      image = "docker.io/superseriousbusiness/gotosocial:latest";
      ports = ["127.0.0.1:1112:8080"];
      user = "1000:1000";
      volumes = ["${import ../values/podman-data-dir.nix}/gotosocial/data:/gotosocial/storage"];
    };
  };
}
