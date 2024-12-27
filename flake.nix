{
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-24.11";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, disko, home-manager }: {
    nixosConfigurations = let
      common = [
        disko.nixosModules.disko
        home-manager.nixosModules.home-manager
        ./configuration.nix
      ];
    in {
      livingroom = nixpkgs.lib.nixosSystem {
        modules = common ++ [ ./hosts/livingroom ];
      };

      testvm = nixpkgs.lib.nixosSystem {
        modules = common ++ [ ./hosts/testvm ];
      };
    };
  };
}
