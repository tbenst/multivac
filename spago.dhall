{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "multivac"
, dependencies =
    [ "behaviors", "console", "drawing", "effect", "halogen", "psci-support" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
