{...}: {
  home.file = {
    ".local/bin/ubuntu" = {
      executable = true;
      text = ''
        #!/usr/bin/env bash

        podman run --rm -it ubuntu:latest bash
      '';
    };
  };
}
