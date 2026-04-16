{...}: {
  virtualisation.oci-containers.containers."mytrix" = {
    image = "fovir/mytrix:latest";

    environment = import ../values/mytrix-env.nix;
    pull = "always";
    volumes = ["${import ../values/podman-data-dir.nix}/mytrix:/data"];
  };
}
