{pkgs, ...}: {
  virtualisation.oci-containers.containers."postgres" = {
    image = "postgres:17";
    autoStart = true;
    environment = import ../values/postgres-environment.nix;
    volumes = ["postgres:/var/lib/postgresql/data:rw"];
    ports = ["127.0.0.1:5432:5432"];
  };

  systemd.services.auto-create-user-db = {
    wantedBy = ["multi-user.target"];
    after = ["podman-postgres.service"];
    # requires = ["podman-postgres.service"];
    description = "Initialize PostgreSQL users and databases";
    # Without this line, it would Error: configure storage: the 'zfs' command is not available: prerequisites for driver not satisfied (wrong filesystem?)
    path = with pkgs; [zfs];
    serviceConfig = {
      Type = "oneshot";
      SuccessExitStatus = "0 1";
      ExecStart = ''
        ${pkgs.podman}/bin/podman exec -i postgres \
        psql -U postgres \
        -c "CREATE ROLE wakapi WITH LOGIN PASSWORD '${import ../values/wakapi-db-pwd.nix}';" \
        -c "CREATE DATABASE wakapi OWNER wakapi;" \
        -c "CREATE DATABASE gotosocial WITH locale 'C.UTF-8' template template0;" \
        -c "CREATE USER gotosocial WITH PASSWORD '${import ../values/gotosocial-db-pwd.nix}';"
      '';
    };
  };
}
