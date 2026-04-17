-- ExecutionPolicy.dhall
-- Controls how and where automation actions execute.
--
-- Exports { Input, Type, default, mk } so consumers can write
-- `Schema.ExecutionPolicy::{ allowCI = True }` and let the rest default.

let ExecutionPolicyType =
      { allowLocal : Bool
        -- Whether to run actions on the local machine

      , allowCI : Bool
        -- Whether to run actions in CI environments

      , maxConcurrency : Optional Integer
        -- Maximum number of concurrent action executions
      }

let ExecutionPolicyInput = {}

let executionPolicyDefault =
      { allowLocal = True, allowCI = False, maxConcurrency = None Integer }

let mkExecutionPolicy =
      \(input : ExecutionPolicyInput) ->
        ((executionPolicyDefault // input) : ExecutionPolicyType)

in  { Type = ExecutionPolicyType
    , Input = ExecutionPolicyInput
    , default = executionPolicyDefault
    , mk = mkExecutionPolicy
    }
