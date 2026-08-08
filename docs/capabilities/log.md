# Capability catalog log

## 2026-08-08

**Adopted the shared capabilities profile.** Authored the initial capability catalog under the `coordination.capabilities`
profile (okf-profiles v0.9.0). Derived three capabilities from the schema source,
the repository's own `mori.dhall`, and git history:

- **CAP-1 Project configuration schema** — the core `.` package a consumer imports
  to author `mori.dhall` (identity, packages, dependencies, APIs, runtimes, agents,
  OKF bundles, and the canonical `mori://` reference vocabulary).
- **CAP-2 Automation schema** — the optional automation subsystem (selectors,
  reactions, signals, schedules, decision routing); requires CAP-1.
- **CAP-3 Extension catalog schemas** — the four registered standalone extension
  packages (cookbook, tech-radar, checklist, upstream-issues).

No test suite exists; evidence is schema modules plus the type-checked descriptor.
The project has no releases, so every `since` is `unreleased`. Registered the
bundle in `mori.dhall` under `okfBundles`.
</content>
