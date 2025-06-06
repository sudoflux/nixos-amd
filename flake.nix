{
  description = "Josh's NixOS config with Hyprland and flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in {
      nixosConfigurations.um350 = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/um350/configuration.nix
          ./modules/common.nix
          ./modules/hyprland.nix
          home-manager.nixosModules.home-manager,
          {
            home-manager.users.josh = import ./home/josh.nix;
          }
        ];
      };
    };
}
