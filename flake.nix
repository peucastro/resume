{
  description = "A Nix flake for the development of my résumé.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {inherit system;};

        customTexLive = pkgs.texlive.combine {
          inherit
            (pkgs.texlive)
            scheme-medium
            latexmk
            hyperref
            fontawesome5
            enumitem
            babel
            geometry
            xcolor
            titlesec
            fancyhdr
            preprint
            ;
        };
      in {
        formatter = pkgs.alejandra;

        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            customTexLive
            tex-fmt
          ];
        };
      }
    );
}
