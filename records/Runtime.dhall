-- Runtime.dhall
-- Runtime characteristics of a package

let RuntimeType =
      { deployable : Bool
        -- Whether this package produces a deployable artifact

      , exposesApi : Bool
        -- Whether this package exposes an API
      }

let RuntimeInput = {}

let runtimeDefault = { deployable = False, exposesApi = False }

let mkRuntime =
      \(input : RuntimeInput) -> ((runtimeDefault // input) : RuntimeType)

in  { Type = RuntimeType
    , Input = RuntimeInput
    , default = runtimeDefault
    , mk = mkRuntime
    }
