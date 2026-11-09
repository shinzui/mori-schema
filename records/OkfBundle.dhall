-- OkfBundle.dhall
-- An OKF (Open Knowledge Format) knowledge bundle owned by this project.
--
-- An OKF bundle is a directory of Markdown "concept" notes with an
-- optional house profile describing the conventions it follows. This is
-- a completely separate concept from PackageBundle (which groups Haskell
-- packages); do not conflate the two.
let ProfileBinding = ./ProfileBinding.dhall

let OkfBundleType =
      { name : Text
      , path : Text
      , profile : Optional Text
      , profileBinding : Optional ProfileBinding
      , okfVersion : Text
      , isDocumentation : Bool
      , description : Optional Text
      }

let OkfBundleInput = { name : Text, path : Text, okfVersion : Text }

let okfBundleDefault =
      { profile = None Text
      , profileBinding = None ProfileBinding
      , isDocumentation = False
      , description = None Text
      }

let mkOkfBundle =
      \(input : OkfBundleInput) -> okfBundleDefault // input : OkfBundleType

in  { Type = OkfBundleType
    , Input = OkfBundleInput
    , default = okfBundleDefault
    , mk = mkOkfBundle
    }
