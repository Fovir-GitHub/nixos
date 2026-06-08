{...}: {
  virtualisation.oci-containers.containers."mytrix" = {
    image = "fovir/mytrix:latest";

    environment = import ../values/mytrix-env.nix;
    pull = "always";
    volumes = ["mytrix:/data"];
  };
}
