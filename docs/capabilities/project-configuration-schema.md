---
title: "Project configuration schema"
type: Capability
description: "Typed Dhall records, with defaults, for authoring a project's mori.dhall descriptor — identity, repos, packages, dependencies, APIs, runtimes, config, docs, agents, and canonical mori:// references."
generated:
  by: claude-code/2.0
  at: "2026-08-08T00:00:00Z"
capabilityId: CAP-1
provider: mori://shinzui/mori-schema
status: shipped
stability: stable
since: unreleased
packages:
  - mori-schema
interface:
  - Schema.Project
  - Schema.ProjectIdentity
  - Schema.Package
  - Schema.Dependency
  - Schema.MoriRef
  - Schema.OkfBundle
  - Schema.UserConfig
evidence:
  - kind: module
    resource: package.dhall
    proves: The single import surface a consumer pulls in; re-exports every type, record, and root so a `mori.dhall` can be authored from one `let Schema = …/package.dhall`.
  - kind: module
    resource: Project.dhall
    proves: The root `Project` record with defaults — the exact field set (repos, packages, dependencies, apis, okfBundles, automation, …) a descriptor populates.
  - kind: example
    resource: mori.dhall
    proves: This repository's own descriptor authored against the schema; `mori validate` type-checks it, demonstrating the schema is usable end to end.
---

# Project configuration schema

`mori-schema` is the Dhall library a repository imports to author its `mori.dhall`
project descriptor. A consumer adds one import and constructs a `Project` value:

```dhall
let Schema =
      https://raw.githubusercontent.com/shinzui/mori-schema/<sha>/package.dhall
        sha256:<hash>

in  Schema.Project::{
    , project = Schema.ProjectIdentity::{
      , name = "my-project"
      , namespace = "shinzui"
      , type = Schema.PackageType.Library
      , language = Schema.Language.Haskell
      , lifecycle = Schema.Lifecycle.Active
      }
    , repos = [ Schema.Repo::{ name = "my-project", github = Some "shinzui/my-project" } ]
    , packages = [ Schema.Package::{ name = "my-project", … } ]
    }
```

The library provides record types with sensible defaults (via each record's
`::{ … }` completion) for project identity, repos, packages and package bundles,
dependencies and deprecations, APIs and their update policies, runtimes, config
items, agent hints, skills and subagents, standard-project and Seihou-template
metadata, doc references, OKF bundle registration, and user-level CLI config
(`UserConfig`). It also defines the canonical `mori://` reference vocabulary —
`MoriRef` plus the `MoriArtifactKind` union over every artifact kind the mori CLI
can resolve — so cross-repository references can be expressed as typed values.

Everything under the root package path (`.`) is adopted as one decision: a
consumer imports `package.dhall` and pins one commit. The automation subsystem
and the extension catalog schemas are separate capabilities layered on or beside
this base.

## Limits

- **No test suite.** There are no property, golden, or conformance tests over the
  schema. The only executable proof that the schema works is that descriptors
  authored against it — including this repository's own `mori.dhall` — type-check
  under `mori validate` / `dhall type`. Evidence here is weaker than a catalog
  backed by tests; treat the schema as validated by use, not by an independent
  test corpus.
- **No releases.** The project publishes no tags or versioned artifacts;
  consumers pin by commit SHA. Every capability in this catalog therefore carries
  `since: unreleased`.
- **`MoriRef` cannot type three nested reference forms.** OKF concept, checklist
  step, and DDD flow-step references have no typed representation and travel as
  canonical `Text` in a `DocLocation.Canonical` arm (documented in
  `records/MoriRef.dhall`).
- **`MoriArtifactKind` arm order is a hand-maintained mirror** of a Haskell sum
  type (`mori-core` `Mori.Modules.Refs.Domain.Types`); the ordering is a public
  contract but drift between the two is not mechanically checked here.
</content>
</invoke>
