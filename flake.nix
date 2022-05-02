{
  inputs = {
    nixpkgs-unstable = {
      url = "nixpkgs/nixos-unstable";
    };
    nixos-generators = {
      url = "github:nix-community/nixos-generators";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };
  outputs = { self, nixpkgs-unstable, nixos-generators, ... }@inputs: {
    packages.x86_64-linux = {
      iso = nixos-generators.nixosGenerate {
        format = "iso";
      };
    };
  };
};
