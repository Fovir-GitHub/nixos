{...}: {
  virtualisation.oci-containers.containers."authelia" = let
    configFile = ../values/authelia-config.yml;
    userConfig = ../values/authelia-users-database.yml;
  in {
    environment = import ../values/authelia-env.nix;
    image = "authelia/authelia";
    ports = ["127.0.0.1:9091:9091"];
    volumes = [
      "${configFile}:/config/configuration.yml"
      "${import ../values/podman-data-dir.nix}/authelia:/config"
      "${userConfig}:/config/users_database.yml"
    ];
  };
}
