-- Runtime.dhall
-- Runtime characteristics of a package

{ deployable : Bool
  -- Whether this package produces a deployable artifact

, exposesApi : Bool
  -- Whether this package exposes an API
}
