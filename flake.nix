{
  inputs = {
    clan-core = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "https://git.clan.lol/clan/clan-core/archive/main.tar.gz";
    };
    disko = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/disko/latest";
    };
    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager";
    };
    hyprshell.url = "github:H3rmt/hyprshell?ref=hyprshell-release";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    nixpkgs-25-05.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
  };

  outputs = {
    self,
    clan-core,
    nixpkgs,
    ...
  } @ inputs: let
    # Usage see: https://docs.clan.lol
    clan = clan-core.lib.clan {
      inherit self;
      imports = [
        ./clan.nix
      ];
      specialArgs = {inherit inputs;};
    };
  in {
    inherit (clan.config) nixosConfigurations nixosModules clanInternals;
    clan = clan.config;
    # Add the Clan cli tool to the dev shell.
    # Use "nix develop" to enter the dev shell.
    devShells =
      nixpkgs.lib.genAttrs
      [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ]
      (system: {
        default = clan-core.inputs.nixpkgs.legacyPackages.${system}.mkShell {
          packages = with clan-core.inputs.nixpkgs.legacyPackages.${system}; [
            alejandra
            clan-core.packages.${system}.clan-cli
            deadnix
            just
            pre-commit
            sops
          ];
        };
      });
  };
}
