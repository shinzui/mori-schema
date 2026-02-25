-- ExecutionPolicy.dhall
-- Controls how and where automation actions execute

{ allowLocal : Bool
  -- Whether to run actions on the local machine

, allowCI : Bool
  -- Whether to run actions in CI environments

, maxConcurrency : Optional Integer
  -- Maximum number of concurrent action executions
}
