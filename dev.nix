# Assumes foo and bar branch are checked out locally as ../foo and ../bar
# respectively.
{ pkgs ? import <nixpkgs> {}
, lib ? pkgs.lib
}:
let
  foo = pkgs.callPackage ./foo.nix {};
  fooLocal = foo.overrideAttrs (oldAttrs: {
    src = lib.cleanSource ../foo;
  });

  bar = pkgs.callPackage ./bar.nix {
    foo = fooLocal;
  };
in
bar.overrideAttrs (oldAttrs: {
  src = lib.cleanSource ../bar;
})
