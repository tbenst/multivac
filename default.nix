with import <nixpkgs> {};

let 
  spagoPkgs = import ./spago-packages.nix { inherit pkgs; };
  removeHashBang = drv: drv.overrideAttrs (oldAttrs: {
    buildCommand = builtins.replaceStrings ["#!/usr/bin/env"] [""] oldAttrs.buildCommand;
  });
in
mkYarnPackage rec {
  name = "purescript-multivac";
  src = ./.;
  packageJSON = ./package.json;
  yarnLock = ./yarn.lock;

  postBuild = ''
    ${removeHashBang spagoPkgs.installSpagoStyle} # == spago2nix install
    ${removeHashBang spagoPkgs.buildSpagoStyle}   # == spago2nix build
    ${removeHashBang spagoPkgs.buildFromNixStore} # == spago2nix build
  '';

  meta = with stdenv.lib; {
    description = "HTML/js viz helpers.";
    homepage = "https://github.com/tbenst/multivac";
    maintainers = with maintainers; [ tbenst ];
  };
}