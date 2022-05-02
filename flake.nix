{
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
    };
  };
  outputs = { self, nixpkgs, nixos-generators, nixos-hardware, ... }@inputs: {
    packages.x86_64-linux = {
      iso = nixos-generators.nixosGenerate {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        format = "iso";
        modules = [
          # ./images/iso.nix
        ];
      };
      rsp4 = nixos-generators.nixosGenerate {
        pkgs = nixpkgs.legacyPackages.aarch64-linux;
        format = "sd-aarch64";
        modules = [
          nixos-hardware.nixosModules.raspberry-pi-4
          ./images/rpi4.nix
        ];
      };
      rsp4-installer = nixos-generators.nixosGenerate {
        pkgs = nixpkgs.legacyPackages.aarch64-linux;
        format = "sd-aarch64-installer";
        modules = [
          nixos-hardware.nixosModules.raspberry-pi-4
        ];
      };
    };
  };
}
