{
  description = "Ceramics Teaching Materials";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";

    nixpkgs-stable.url = "github:nixos/nixpkgs/release-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs.follows = "nixpkgs-stable";
  };

  outputs = inputs @ { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs { inherit system; };
      mkScript = pkgs.writeShellScriptBin;

      shell = with pkgs; mkShell {
        packages = [
          # Insert packages here
          texlive.combined.scheme-full
          texlab
          rubber 

          # Insert shell aliases here
          (mkScript "build" ''for i in *.tex; do rubber -d $i; rubber --clean $i; done'')
        ];

        shellHook = ''
          export MY_ENV="world"
        '';
      };
    in {
      devShells.default = shell;
    });
}

