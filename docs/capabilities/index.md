---
okf_version: "0.2"
---

# mori-schema capabilities

What `mori-schema` provides to a consumer today. `mori-schema` is a Dhall schema
library: a repository imports it to author its `mori.dhall` project descriptor,
optional automation, and typed sidecar catalogs. Every capability below is proven
by an artifact a reader can open — a schema module or this repository's own
type-checked descriptor.

Because the project publishes no releases or tags (consumers pin by commit SHA),
every record carries `since: unreleased`.

## Deliberately excluded

- **The individual record and type modules** are not separate capabilities. A
  consumer imports `package.dhall` wholesale and adopts the descriptor schema as
  one decision; one record per module would be a worse copy of the schema tree.
- **`extensions/ddd` and `extensions/agent-plans`** are present on disk but are
  not registered as packages in `mori.dhall`, so they are not claimed as part of
  CAP-3. See that record's Limits.
- **Automation *execution*** — reaction firing, signal delivery, scheduling — is
  not claimed. This repository is the schema, not the engine; those behaviors
  belong to the executing repositories (a composition/use-case concern, not a
  provision of this repository).

## Capabilities

| ID | Capability | Stability | Since | Packages |
|----|------------|-----------|-------|----------|
| [CAP-1](./project-configuration-schema.md) | Project configuration schema | stable | unreleased | `mori-schema` |
| [CAP-2](./automation-schema.md) | Automation schema | experimental | unreleased | `mori-schema` |
| [CAP-3](./extension-catalog-schemas.md) | Extension catalog schemas | experimental | unreleased | `mori-schema-cookbook`, `mori-schema-tech-radar`, `mori-schema-checklist`, `mori-schema-upstream-issues` |
</content>
