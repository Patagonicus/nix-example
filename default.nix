{ pkgs ? import <nixpkgs> {}
}:
let
  foo = pkgs.callPackage ./foo.nix {};
in
pkgs.callPackage ./bar.nix {
  inherit foo;
}
