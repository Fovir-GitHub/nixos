{...}: {
  virtualisation.oci-containers.containers."mytrix" = {
    image = "ghcr.io/fovir-github/mytrix:latest";

    environment = import ../values/mytrix-env.nix;
    pull = "always";
    volumes = ["${import ../values/podman-data-dir.nix}/mytrix:/data"];
  };
}
