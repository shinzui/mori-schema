-- PackageBundle.dhall
-- Groups of packages that are typically used together
--
-- Example: streamly + streamly-core are always used together

let PackageBundleType =
      { name : Text
        -- Bundle name (e.g., "streamly")

      , description : Optional Text
        -- What this bundle provides

      , packages : List Text
        -- Package names included in the bundle

      , primary : Text
        -- The "main" package for imports
      }

let PackageBundleInput =
      { name : Text, primary : Text, packages : List Text }

let packageBundleDefault = { description = None Text }

let mkPackageBundle =
      \(input : PackageBundleInput) ->
        ((packageBundleDefault // input) : PackageBundleType)

in  { Type = PackageBundleType
    , Input = PackageBundleInput
    , default = packageBundleDefault
    , mk = mkPackageBundle
    }
