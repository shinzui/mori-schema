-- ConfigItem.dhall
-- Configuration requirement declaration

let ConfigValueType = ../types/ConfigValueType.dhall
let ConfigSourceHint = ../types/ConfigSourceHint.dhall

let ConfigItemType =
      { key : Text
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

let ConfigItemInput = { key : Text, type : ConfigValueType }

let configItemDefault =
      { required = False
      , description = None Text
      , sourceHint = None ConfigSourceHint
      , example = None Text
      }

let mkConfigItem =
      \(input : ConfigItemInput) ->
        ((configItemDefault // input) : ConfigItemType)

in  { Type = ConfigItemType
    , Input = ConfigItemInput
    , default = configItemDefault
    , mk = mkConfigItem
    }
