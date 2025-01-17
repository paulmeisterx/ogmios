{ compiler ? "ghc8107"
, system ? builtins.currentSystem
, haskellNix ? import
    (builtins.fetchTarball
      "https://github.com/input-output-hk/haskell.nix/archive/974a61451bb1d41b32090eb51efd7ada026d16d9.tar.gz")
    { }
, iohkNix ? import
    (builtins.fetchTarball
      "https://github.com/input-output-hk/iohk-nix/archive/edb2d2df2ebe42bbdf03a0711115cf6213c9d366.tar.gz")
    { }
, nixpkgsSrc ? haskellNix.sources.nixpkgs-unstable
, nixpkgsArgs ? haskellNix.nixpkgsArgs
}:
let
  pkgs = import nixpkgsSrc (nixpkgsArgs // {
    overlays =
      # iohkNix overlay needed for cardano-api wich uses a patched libsodium
      haskellNix.overlays ++ iohkNix.overlays.crypto;
  });
  musl64 = pkgs.pkgsCross.musl64;
in
musl64.haskell-nix.project {
  compiler-nix-name = compiler;
  projectFileName = "cabal.project";
  src = musl64.haskell-nix.haskellLib.cleanSourceWith {
    name = "ogmios-src";
    src = ./.;
    subDir = "server";
    filter = path: type:
      builtins.all (x: x) [
        (baseNameOf path != "package.yaml")
      ];
  };
}
