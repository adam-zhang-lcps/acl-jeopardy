{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: {
    packages.x86_64-linux.default = with nixpkgs.legacyPackages.x86_64-linux;
      rustPlatform.buildRustPackage {
        pname = "acl-jeopardy";
        version = "0.0.1";

        src = ./.;

        cargoLock.lockFile = ./Cargo.lock;
      };
    devShells.x86_64-linux.default = with nixpkgs.legacyPackages.x86_64-linux;
      mkShell {
        nativeBuildInputs = [rustc cargo];
      };
  };
}
