-- PackageBundle.dhall
-- Groups of packages that are typically used together
--
-- Example: streamly + streamly-core are always used together

{ name : Text
  -- Bundle name (e.g., "streamly")

, description : Optional Text
  -- What this bundle provides

, packages : List Text
  -- Package names included in the bundle

, primary : Text
  -- The "main" package for imports
}
