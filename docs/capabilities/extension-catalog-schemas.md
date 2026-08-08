---
title: "Extension catalog schemas"
type: Capability
description: "Standalone Dhall packages providing typed catalog schemas for mori sidecar files — cookbook, tech-radar, checklist, and upstream-issues."
generated:
  by: claude-code/2.0
  at: "2026-08-08T00:00:00Z"
capabilityId: CAP-3
provider: mori://shinzui/mori-schema
status: shipped
stability: experimental
since: unreleased
packages:
  - mori-schema-cookbook
  - mori-schema-tech-radar
  - mori-schema-checklist
  - mori-schema-upstream-issues
interface:
  - Cookbook.CookbookCatalog
  - TechRadar.TechRadar
  - Checklist.ChecklistCatalog
  - UpstreamIssues.UpstreamIssuesCatalog
evidence:
  - kind: module
    resource: extensions/cookbook/package.dhall
    proves: A typed cookbook catalog (CookbookCatalog, CookbookEntry, ContentType, Topic) authored in a mori/cookbook.dhall sidecar.
  - kind: module
    resource: extensions/tech-radar/package.dhall
    proves: A typed tech-radar (TechRadar, Recommendation, AdoptionLevel, Category) authored in a mori/tech-radar.dhall sidecar.
  - kind: module
    resource: extensions/checklist/package.dhall
    proves: A typed checklist catalog (ChecklistCatalog, Checklist, ChecklistItem, StepKind, Category) authored in a mori/checklist.dhall sidecar.
  - kind: module
    resource: extensions/upstream-issues/package.dhall
    proves: A typed upstream-issues catalog (UpstreamIssuesCatalog, UpstreamIssue, IssueStatus) authored in a mori/upstream-issues.dhall sidecar.
---

# Extension catalog schemas

Beside the core descriptor, `mori-schema` ships standalone Dhall packages under
`extensions/`, each providing a typed catalog schema for a `mori/<name>.dhall`
sidecar file:

```dhall
let Cookbook =
      https://raw.githubusercontent.com/shinzui/mori-schema/<sha>/extensions/cookbook/package.dhall

in  Cookbook.CookbookCatalog::{ entries = [ Cookbook.CookbookEntry::{ … } ] }
```

Four are registered as consumable packages: `mori-schema-cookbook`,
`mori-schema-tech-radar`, `mori-schema-checklist`, and
`mori-schema-upstream-issues`. They are one capability, not four, because each is
the same kind of thing — a standalone `package.dhall` re-exporting a catalog root
plus its entry and enum types — and adopting the next extension is the same
decision again. They share no code with the core project configuration schema
(CAP-1) and are imported independently, so this capability does not require it —
there is deliberately no body link to CAP-1, since a link would imply a
dependency edge that does not exist.

## Limits

- **On-disk extensions exceed registered packages.** `extensions/` also contains
  `ddd` and `agent-plans` — complete, importable Dhall packages with their own
  `package.dhall` — but neither is declared under `packages` in `mori.dhall`, so
  neither appears in `mori registry search` and neither is claimed here. They are
  a real surface the registry does not describe; a consumer would only find them
  by reading the tree. Registering them (or deliberately excluding them) is an
  open follow-up.
- **Module-only evidence.** No `mori/<name>.dhall` sidecar catalog is committed in
  this repository, so the proof is that each schema type-checks, not that a worked
  catalog exists. Evidence here is weaker than for a capability with an example
  fixture.
- **Marked `experimental`.** These schemas are recent and, with no releases, a
  consumer pins a moving default branch.
</content>
