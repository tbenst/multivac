with import <nixpkgs> {};

let 
  spagoPkgs = import ./spago-packages.nix { inherit pkgs; };
in
mkYarnPackage rec {
  name = "multivac";
  src = ./.;
  packageJSON = ./package.json;
  yarnLock = ./yarn.lock;

  nativeBuildInputs = [ purescript nodejs-12_x ];

  postBuild = ''
    ${purescript}/bin/purs compile "$src/**/*.purs" ${builtins.toString
      (builtins.map
        (x: ''"${x.outPath}/src/**/*.purs"'')
        (builtins.attrValues spagoPkgs.inputs))}
    cp -r $src/assets ./
    '';

  postFixup = ''
    mkdir -p $out/dist
    ${spago}/bin/spago bundle-app --no-install \
      --no-build --main Multivac.Main --to $out/dist/app.js
    ln -s $out/libexec/${name}/node_modules .
    ${nodejs-12_x}/bin/node node_modules/.bin/parcel \
      build assets/*.html --out-dir $out/dist/
  '';

  meta = with stdenv.lib; {
    description = "HTML/js viz helpers.";
    homepage = "https://github.com/tbenst/multivac";
    maintainers = with maintainers; [ tbenst ];
  };
}