with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "purescript-tooling-2019";

  src = ./.;

  buildInputs = [
    pkgs.nodejs-12_x
    pkgs.yarn
  ];

  installPhase = ''
    yarn add --dev purescript spago parcel-bundler
    yarn spago init
    yarn spago install halogen
    mkdir -p dist
    yarn spago build
    yarn parcel assets/*.html
    cp dist/ $out/
    ls $out
  '';

  shellHook = ''
    export PATH="$PWD/node_modules/.bin/:$PATH"
  '';
}