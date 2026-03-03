{
  inputs,
  pkgs,
  ...
}: {
  nixpkgs.overlays = [
    (_final: prev: {
      sui = prev.callPackage ../../pkgs/sui {
        platform = prev.stdenv.hostPlatform;
      };
    })
    (final: prev: {
      vimPlugins =
        prev.vimPlugins
        // {
          hlchunk-nvim = prev.vimPlugins.hlchunk-nvim.overrideAttrs (oldAttrs: {
            src = pkgs.fetchFromGitHub {
              owner = "shellRaining";
              repo = "hlchunk.nvim";
              rev = "3bc2bd7aef28fbed6643534a0fdd0f19966544bc";
              sha256 = "sha256-NcfH9AnURII+MTSoyDgnotpzjcLNxXx1BXnKYXP2C/0=";
            };
          });
        };
    })
    inputs.nix-vscode-extensions.overlays.default
  ];
}
