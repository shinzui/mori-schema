-- ApiUpdatePolicy.dhall
-- Policy for propagating API updates
--
-- Note: This type defines behavioral automation policy.
-- It is used to configure how API changes propagate to consumers.

let ApiUpdateStrategy = ../types/ApiUpdateStrategy.dhall
let ConsumerBatching = ../types/ConsumerBatching.dhall

let ApiUpdatePolicyType =
      { strategy : ApiUpdateStrategy
        -- How to handle updates

      , allowBreaking : Bool
        -- Whether breaking changes are allowed

      , requireTests : Bool
        -- Whether tests must pass before propagating

      , consumerBatching : ConsumerBatching
        -- How to batch consumer updates

      , notes : Optional Text
        -- Additional policy notes
      }

let ApiUpdatePolicyInput =
      { strategy : ApiUpdateStrategy, consumerBatching : ConsumerBatching }

let apiUpdatePolicyDefault =
      { allowBreaking = False, requireTests = True, notes = None Text }

let mkApiUpdatePolicy =
      \(input : ApiUpdatePolicyInput) ->
        ((apiUpdatePolicyDefault // input) : ApiUpdatePolicyType)

in  { Type = ApiUpdatePolicyType
    , Input = ApiUpdatePolicyInput
    , default = apiUpdatePolicyDefault
    , mk = mkApiUpdatePolicy
    }
