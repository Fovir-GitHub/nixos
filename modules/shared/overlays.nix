{inputs, ...}: {
  nixpkgs.overlays = [
    # (_final: prev: {
    #   sui = prev.callPackage ../../pkgs/sui {
    #     platform = prev.stdenv.hostPlatform;
    #   };
    # })
    (_final: prev: {
      stable = import inputs.nixpkgs-stable {system = prev.system;};
      stable2505 = import inputs.nixpkgs-25-05 {system = prev.system;};
    })
    inputs.nix-vscode-extensions.overlays.default
  ];
}
