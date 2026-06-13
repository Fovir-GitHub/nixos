{...}: {
  virtualisation.oci-containers.containers."voidauth" = {
    image = "voidauth/voidauth:latest";
    environment = import ../values/voidauth-env.nix;
    volumes = [
      "voidauth_config:/app/config"
      "voidauth_db:/app/db" # Do not need if using postgres as database
    ];
    ports = ["127.0.0.1:9091:3000"];
  };
}
