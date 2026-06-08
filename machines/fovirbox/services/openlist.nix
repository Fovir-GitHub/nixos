{...}: {
  virtualisation.oci-containers.containers."openlist" = {
    autoStart = true;
    image = "openlistteam/openlist:latest";
    volumes = ["openlist:/opt/openlist/data"];
    ports = ["127.0.0.1:5244:5244"];
    user = "0:0";
    environment = import ../values/openlist-env.nix;
  };
}
