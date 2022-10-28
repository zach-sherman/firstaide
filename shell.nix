{ ... }:
let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs { };
in pkgs.mkShell {
  buildInputs = [
    pkgs.git
    pkgs.niv
    pkgs.cargo
    pkgs.cargo-edit # for `cargo upgrade`
    pkgs.clippy
    pkgs.libiconv
    pkgs.rustc
    pkgs.rustfmt
  ];
}
