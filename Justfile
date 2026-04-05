valuePath:="./machines/*/values/* ./modules/values/*"

sv:
  # Stash values.
  git stash push -m "Stash Values" {{valuePath}}

pv:
  # Stash pop values.
  git stash pop

ea:
  # Encrypt all values of machines.
  ls {{valuePath}} | xargs -n 1 sops encrypt -i

da:
  # Decrypt all values of machines.
  ls {{valuePath}} | xargs -n 1 sops decrypt -i

vm host:
  # Build vm.
  git add --all
  nixos-rebuild build-vm --flake .#{{host}} --show-trace
  git restore --staged .

cv:
  # Commit all values automatically.
  git add {{valuePath}}
  git commit -m "chore: encrypt values"

ec:
  # Encrypt and commit values.
  just ea
  just cv

install host target:
  # Install machine {{host}} to {{target}}.
  git add --all
  clan machines install {{host}} --target-host {{target}} --update-hardware-config nixos-facter
  git restore --staged .

update host:
  # Update machine configuration.
  git add --all
  clan machines update {{host}} --build-host localhost
  git restore --staged .

format:
  # Use alejandra and deadnix to format code
  deadnix -e
  alejandra .

check host:
  # Check whether configurations are valid.
  git add --all
  nix eval .#nixosConfigurations.{{host}}.config.system.build.toplevel
  nixos-rebuild dry-build --flake .#{{host}}
  git restore --staged .

switch host:
  # Switch to the configuration of `host`.
  git add --all
  sudo nixos-rebuild switch --flake .#{{host}} --show-trace
  git restore --staged .

gc:
  # Do garbage-clean (remove unused packages, etc).
  sudo nix profile wipe-history --older-than 7d --profile /nix/var/nix/profiles/system
  sudo nix-collect-garbage --delete-old
