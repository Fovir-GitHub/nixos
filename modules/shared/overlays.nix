{inputs, ...}: {
  nixpkgs.overlays = [
    # (_final: prev: {
    #   sui = prev.callPackage ../../pkgs/sui {
    #     platform = prev.stdenv.hostPlatform;
    #   };
    # })
    (_final: prev: {
      stable2511 = import inputs.nixpkgs-25-11 {system = prev.system;};
      stable2505 = import inputs.nixpkgs-25-05 {system = prev.system;};
      unstable = import inputs.nixpkgs-unstable {system = prev.system;};
    })
    inputs.nix-vscode-extensions.overlays.default
  ];
}
