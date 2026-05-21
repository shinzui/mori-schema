-- Verification.dhall
-- Model-level review/verification metrics: when the model was last
-- reviewed, what fraction of aggregates have tests, and free-text notes.

let VerificationType =
      { lastReviewed : Optional Text
      , coveragePercent : Optional Natural
      , notes : Optional Text
      }

let VerificationInput = {}

let verificationDefault =
      { lastReviewed = None Text
      , coveragePercent = None Natural
      , notes = None Text
      }

let mkVerification =
      \(input : VerificationInput) ->
        ((verificationDefault // input) : VerificationType)

in  { Type = VerificationType
    , Input = VerificationInput
    , default = verificationDefault
    , mk = mkVerification
    }
