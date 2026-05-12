-- IdempotencyCheck.dhall
-- A shell-command check run by the scheduled-reaction worker just before
-- the reaction's actions execute. Its exit code, combined with the
-- `skipOnExit` polarity, decides whether the worker proceeds with the
-- reaction or emits a ReactionSkipped event.
--
-- Exports { Input, Type, default, mk }. Only `command` is required: a
-- check without a command is meaningless. Everything else has a sensible
-- default and may be omitted at the call site.

let SkipOnExit = ./SkipOnExit.dhall

let IdempotencyCheckType =
      { command : Text
        -- Program or script to execute as the check

      , args : List Text
        -- Arguments passed to the command

      , timeout : Optional Integer
        -- Timeout in seconds (None = no timeout)

      , env : List { mapKey : Text, mapValue : Text }
        -- Extra environment variables to set on top of the mori
        -- MORI_* variables documented in docs/user/automation.md

      , skipOnExit : SkipOnExit
        -- Which exit-code class causes the worker to skip the reaction
      }

let IdempotencyCheckInput = { command : Text }

let idempotencyCheckDefault =
      { args = [] : List Text
      , timeout = None Integer
      , env = [] : List { mapKey : Text, mapValue : Text }
      , skipOnExit = SkipOnExit.NonZero
      }

let mkIdempotencyCheck =
      \(input : IdempotencyCheckInput) ->
        ( (idempotencyCheckDefault // input)
          : IdempotencyCheckType
        )

in  { Type = IdempotencyCheckType
    , Input = IdempotencyCheckInput
    , default = idempotencyCheckDefault
    , mk = mkIdempotencyCheck
    }
