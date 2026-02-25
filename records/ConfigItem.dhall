-- ConfigItem.dhall
-- Configuration requirement declaration

let ConfigValueType = ../types/ConfigValueType.dhall
let ConfigSourceHint = ../types/ConfigSourceHint.dhall

in  { key : Text
      -- Configuration key/name

    , type : ConfigValueType
      -- Expected value type

    , required : Bool
      -- Whether this config is required

    , description : Optional Text
      -- Human-readable description

    , sourceHint : Optional ConfigSourceHint
      -- Hint for where to find the value

    , example : Optional Text
      -- Example value
    }
