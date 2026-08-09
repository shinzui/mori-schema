-- OkfProfile.dhall
-- An OKF profile published by this project.

let OkfProfileType =
      { name : Text
        -- URI-safe profile key, used by mori://.../profiles/<name>.

      , export : Text
        -- Dot path exported by the publisher's package.dhall.

      , path : Optional Text
        -- Optional project-relative source path for the profile.

      , description : Optional Text
        -- Brief human-readable description.

      , version : Optional Text
        -- Publisher-declared current release tag.
      }

let OkfProfileInput = { name : Text, export : Text }

let okfProfileDefault =
      { path = None Text
      , description = None Text
      , version = None Text
      }

let mkOkfProfile =
      \(input : OkfProfileInput) ->
        ((okfProfileDefault // input) : OkfProfileType)

in  { Type = OkfProfileType
    , Input = OkfProfileInput
    , default = okfProfileDefault
    , mk = mkOkfProfile
    }
