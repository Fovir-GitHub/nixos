{inputs, ...}: {
  nixpkgs.overlays = [
    (_final: prev: {
      sui = prev.callPackage ../../pkgs/sui {
        platform = prev.stdenv.hostPlatform;
      };
    })
    (final: prev: {
      stable2505 = inputs.nixpkgs-25-05.legacyPackages.${prev.system};
    })
    inputs.nix-vscode-extensions.overlays.default
  ];
}
