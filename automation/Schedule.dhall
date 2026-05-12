-- Schedule.dhall
-- Per-reaction scheduling configuration. Attaching a `Schedule` to a
-- Reaction tells the automation engine to enqueue the reaction's actions
-- on the `scheduled_reactions` pgmq queue rather than running them
-- inline, optionally gated by an IdempotencyCheck.
--
-- Exports { Input, Type, default, mk }. All fields are optional: a
-- Schedule with no `after` and no `idempotencyCheck` is degenerate but
-- still well-typed. The runtime rejects degenerate Schedules with a
-- clear error. Keeping Input empty lets users write
-- `Schema.Schedule::{ after = Some "PT1H" }` without supplying other
-- fields.

let IdempotencyCheck = ./IdempotencyCheck.dhall

let ScheduleType =
      { after : Optional Text
        -- ISO 8601 duration string (e.g. "PT1H", "PT1H30M", "P1D")
        -- representing how long to defer the reaction. None means
        -- "no delay" — combined with an idempotencyCheck this lets
        -- a reaction run "now, but only if the check passes".

      , idempotencyCheck : Optional IdempotencyCheck.Type
        -- Pre-execution shell check. Runs just before the reaction's
        -- actions fire. Exit code + skipOnExit polarity decide whether
        -- the worker proceeds or emits ReactionSkipped.

      , coalesceKey : Optional Text
        -- Opt-in debounce: when a new schedule lands with the same
        -- (repo, automation, reaction, coalesceKey) tuple as a
        -- pending schedule, the prior schedule is cancelled and only
        -- the new one survives.
      }

let ScheduleInput = {} : Type

let scheduleDefault =
      { after = None Text
      , idempotencyCheck = None IdempotencyCheck.Type
      , coalesceKey = None Text
      }

let mkSchedule =
      \(_ : ScheduleInput) ->
        ( (scheduleDefault // {=})
          : ScheduleType
        )

in  { Type = ScheduleType
    , Input = ScheduleInput
    , default = scheduleDefault
    , mk = mkSchedule
    }
