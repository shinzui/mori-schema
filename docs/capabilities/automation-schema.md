---
title: "Automation schema"
type: Capability
description: "Typed Dhall vocabulary for declaring project automation in mori.dhall — event selectors, reactions, structured signals, schedules, and decision-outcome routing."
generated:
  by: claude-code/2.0
  at: "2026-08-08T00:00:00Z"
capabilityId: CAP-2
provider: mori://shinzui/mori-schema
status: shipped
stability: experimental
since: unreleased
packages:
  - mori-schema
interface:
  - Schema.Automation
  - Schema.Reaction
  - Schema.SignalAction
  - Schema.DecisionRoute
  - Schema.Schedule
requires:
  - CAP-1
evidence:
  - kind: module
    resource: automation/Automation.dhall
    proves: The aggregate automation record a `Project` carries — the top-level shape of an automation declaration.
  - kind: module
    resource: automation/Reaction.dhall
    proves: A reaction binds named event selectors to actions with optional scheduling; header documents the parse-time guards and the pgmq queue an over-scheduled reaction enqueues onto.
  - kind: module
    resource: automation/SignalSelector.dhall
    proves: The structured signal vocabulary (selectors, payload predicates, consent, bounds) a reaction matches against.
  - kind: module
    resource: automation/DecisionRoute.dhall
    proves: Decision-outcome routing — mapping a decision result to a downstream action.
---

# Automation schema

The automation subsystem is an optional field on the root `Project`
(see [Project configuration schema (CAP-1)](./project-configuration-schema.md)),
adopted separately from the base descriptor: a `mori.dhall` with no automation is
complete and valid. When a consumer does declare automation, this schema types
the whole surface — typed project event selectors, changeset/ref/signal
selectors, `Reaction`s binding selectors to actions, the action families
(`RunCommandAction`, `EmitEventAction`, `NotifyAction`, `SignalAction`,
`DecisionAction`, `ScheduleAction`), structured project-signal aggregates and
families, `Schedule` / `IdempotencyCheck` / `SkipOnExit`, and `DecisionRoute`
outcome routing.

```dhall
let Schema = …/package.dhall

in  Schema.Reaction::{
    , name = "notify-on-release"
    , on = [ "release-tag-pushed" ]
    , actions = [ … ]
    }
```

It is grouped as one capability because the pieces are proven by the same
evidence and adopted together: a consumer wiring automation reaches for
selectors, reactions, actions, and schedules as a single mechanism, not as
independent choices.

## Limits

- **Authoring surface only — no runtime is exercised here.** This repository is
  the schema, not an engine. Nothing in it proves that any reaction ever fires,
  that signals are delivered, or that schedules run; there is no test, fixture, or
  worked automation example committed. The evidence proves the *shape* of a valid
  automation declaration, nothing about its execution.
- **External infrastructure is referenced but not owned.** `Reaction` documents a
  `scheduled_reactions` pgmq queue and the action families name downstream
  effects that live in other services. The schema types the contract; the
  behavior belongs to the consuming/executing repositories, not here.
- **Marked `experimental`.** The vocabulary is still growing (recent commits added
  signal vocabulary, decision routing, and restored artifact kinds), and with no
  releases a consumer pins a moving default branch.
</content>
