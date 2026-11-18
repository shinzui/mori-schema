-- KeiroModel.dhall
-- Root type for the keiro extension: the keiro services whose committed
-- topology documents this project declares. `Keiro.KeiroModel::{=}` is a
-- valid empty model.
let KeiroWorkspace = ./KeiroWorkspace.dhall

let KeiroModelType = { workspaces : List KeiroWorkspace.Type }

let KeiroModelInput = {}

let keiroModelDefault = { workspaces = [] : List KeiroWorkspace.Type }

let mkKeiroModel =
      \(input : KeiroModelInput) -> keiroModelDefault // input : KeiroModelType

in  { Type = KeiroModelType
    , Input = KeiroModelInput
    , default = keiroModelDefault
    , mk = mkKeiroModel
    }
