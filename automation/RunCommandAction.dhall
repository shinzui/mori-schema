-- RunCommandAction.dhall
-- Payload for Schema.ReactionAction.RunCommand.
--
-- Exports { Input, Type, default, mk } so consumers can write
-- `Schema.ReactionAction.RunCommand Schema.RunCommandAction::{ command = "just" }`
-- and omit args/workingDir/timeout/env.

let RunCommandActionType =
      { command : Text
        -- Program or script to execute

      , args : List Text
        -- Arguments passed to the command

      , workingDir : Optional Text
        -- Working directory (None = project root)

      , timeout : Optional Integer
        -- Timeout in seconds (None = no timeout)

      , env : List { mapKey : Text, mapValue : Text }
        -- Extra environment variables to set
      }

let RunCommandActionInput = { command : Text }

let runCommandActionDefault =
      { args = [] : List Text
      , workingDir = None Text
      , timeout = None Integer
      , env = [] : List { mapKey : Text, mapValue : Text }
      }

let mkRunCommandAction =
      \(input : RunCommandActionInput) ->
        ((runCommandActionDefault // input) : RunCommandActionType)

in  { Type = RunCommandActionType
    , Input = RunCommandActionInput
    , default = runCommandActionDefault
    , mk = mkRunCommandAction
    }
