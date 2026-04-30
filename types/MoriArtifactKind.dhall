-- MoriArtifactKind.dhall
-- Union over the eight artifact kinds carried by a canonical
-- mori:// reference. The order of the arms is part of the public
-- contract: Haskell mirrors derive Bounded/Enum and rely on it.
--
-- Canonical URI form (parsed by the mori CLI, not by Dhall):
--     mori://<namespace>/<name>/<kind-plural>/<key>[#anchor]
-- where <kind-plural> is one of:
--     docs, packages, repos, skills, subagents, apis, cookbook, templates
--
-- Compact alias form (input only, never serialized):
--     <namespace>/<name>[#<kind-singular>:<key>][#anchor]
-- where <kind-singular> is one of:
--     doc, package, repo, skill, subagent, api, cookbook, template

< Doc
| Package
| Repo
| Skill
| Subagent
| Api
| Cookbook
| Template
>
