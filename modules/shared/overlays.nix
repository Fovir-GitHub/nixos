{inputs, ...}: {
  nixpkgs.overlays = [
    (_final: prev: {
      sui = prev.callPackage ../../pkgs/sui {
        platform = prev.stdenv.hostPlatform;
      };
    })
    inputs.nix-vscode-extensions.overlays.default
  ];
}
