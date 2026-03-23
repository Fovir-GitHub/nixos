{...}: {
  virtualisation.oci-containers.containers."mytrix" = {
    image = "ghcr.io/fovir-github/mytrix:main";

    environment = import ../values/mytrix-env.nix;
    pull = "always";
    volumes = ["${import ../values/podman-data-dir.nix}/mytrix:/data"];
  };
}
