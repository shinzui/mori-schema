-- OkfBundle.dhall
-- An OKF (Open Knowledge Format) knowledge bundle owned by this project.
--
-- An OKF bundle is a directory of Markdown "concept" notes with an
-- optional house profile describing the conventions it follows. This is
-- a completely separate concept from PackageBundle (which groups Haskell
-- packages); do not conflate the two.

let OkfBundleType =
      { name : Text
        -- Bundle name (unique within the project)

      , path : Text
        -- Project-relative directory containing the bundle

      , profile : Optional Text
        -- Reference (URL or path) to an okf-profiles Dhall profile this
        -- bundle should follow. Optional: omit when there is no profile.

      , okfVersion : Text
        -- The OKF format version the bundle targets (e.g. "0.1")

      , description : Optional Text
        -- Brief description of the bundle
      }

let OkfBundleInput = { name : Text, path : Text, okfVersion : Text }

let okfBundleDefault = { profile = None Text, description = None Text }

let mkOkfBundle =
      \(input : OkfBundleInput) ->
        ((okfBundleDefault // input) : OkfBundleType)

in  { Type = OkfBundleType
    , Input = OkfBundleInput
    , default = okfBundleDefault
    , mk = mkOkfBundle
    }
