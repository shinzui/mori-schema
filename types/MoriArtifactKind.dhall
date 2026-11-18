-- MoriArtifactKind.dhall
-- Union over the forty-two artifact kinds carried by a canonical
-- mori:// reference. The order of the arms is part of the public
-- contract: Haskell mirrors derive Bounded/Enum and rely on it, so new
-- kinds are APPENDED and existing arms are never reordered or removed.
-- This union mirrors the MoriArtifactKind sum type in
-- mori-core/src/Mori/Modules/Refs/Domain/Types.hs; the Haskell side owns
-- the ordering and this file follows it.
--
-- Canonical URI form (parsed by the mori CLI, not by Dhall):
--     mori://<namespace>/<name>/<kind-plural>/<key>[#anchor]
--
-- Compact alias form (input only, never serialized):
--     <namespace>/<name>[#<kind-singular>:<key>][#anchor]
--
-- Arm                URI segment          Compact token
-- -----------------  -------------------  -----------------
-- Doc                docs                 doc
-- Package            packages             package
-- Repo               repos                repo
-- Skill              skills               skill
-- Subagent           subagents            subagent
-- Api                apis                 api
-- Cookbook           cookbook             cookbook
-- Template           templates            template
-- MasterPlan         masterplans          masterplan
-- ExecPlan           plans                plan
-- OkfBundle          okf                  okf
-- Checklist          checklists           checklist
-- UpstreamIssue      upstream-issues      upstream-issue
-- Recommendation     radar                radar
-- DddSubdomain       ddd/subdomains       ddd-subdomain
-- DddContext         ddd/contexts         ddd-context
-- DddAggregate       ddd/aggregates       ddd-aggregate
-- DddContextMapping  ddd/mappings         ddd-mapping
-- DddFlow            ddd/flows            ddd-flow
-- DddGlossaryTerm    ddd/glossary         ddd-term
-- DddCollaborator    ddd/collaborators    ddd-collaborator
-- OkfProfile         profiles             profile
-- DddReactor         ddd/reactors         ddd-reactor
-- DddProcessManager  ddd/process-managers ddd-process-manager
-- DddDurableWorkflow ddd/durable-workflows ddd-durable-workflow
-- KeiroService            keiro/services             keiro-service
-- KeiroAggregate          keiro/aggregates           keiro-aggregate
-- KeiroProcess            keiro/processes            keiro-process
-- KeiroWorkflow           keiro/workflows            keiro-workflow
-- KeiroRouter             keiro/routers              keiro-router
-- KeiroContract           keiro/contracts            keiro-contract
-- KeiroIntake             keiro/intakes              keiro-intake
-- KeiroEmit               keiro/emits                keiro-emit
-- KeiroWorkqueue          keiro/workqueues           keiro-workqueue
-- KeiroDispatch           keiro/dispatches           keiro-dispatch
-- KeiroReadModel          keiro/read-models          keiro-read-model
-- KeiroOperation          keiro/operations           keiro-operation
-- KeiroProjectionTarget   keiro/projection-targets   keiro-projection-target
-- KeiroRebuildGroup       keiro/rebuild-groups       keiro-rebuild-group
-- KeiroProjectionOwner    keiro/projection-owners    keiro-projection-owner
-- KeiroProjectionRevision keiro/projection-revisions keiro-projection-revision
-- KeiroExternalRead       keiro/external-reads       keiro-external-read
--
-- Not every segment pluralises: cookbook, okf, radar and glossary are
-- mass nouns. The ten ddd/* kinds take a two-segment path; the bare
-- segment "ddd" is not a kind and does not parse.
-- The seventeen keiro/* kinds also take a two-segment path. Their key is
-- <service> for KeiroService and <service>/<name> for every other kind,
-- because one repository may declare several keiro services.
--
-- Three kinds accept a nested sub-key that this type cannot express,
-- because MoriRef has no sub-key field: an OKF concept
-- (okf/<bundle>/concepts/<id>), a checklist step
-- (checklists/<key>/steps/<step>) and a DDD flow step
-- (ddd/flows/<key>/steps/<n>). Those references travel as canonical Text
-- in a DocLocation.Canonical arm rather than as a typed MoriRef.
< Doc
| Package
| Repo
| Skill
| Subagent
| Api
| Cookbook
| Template
| MasterPlan
| ExecPlan
| OkfBundle
| Checklist
| UpstreamIssue
| Recommendation
| DddSubdomain
| DddContext
| DddAggregate
| DddContextMapping
| DddFlow
| DddGlossaryTerm
| DddCollaborator
| OkfProfile
| DddReactor
| DddProcessManager
| DddDurableWorkflow
| KeiroService
| KeiroAggregate
| KeiroProcess
| KeiroWorkflow
| KeiroRouter
| KeiroContract
| KeiroIntake
| KeiroEmit
| KeiroWorkqueue
| KeiroDispatch
| KeiroReadModel
| KeiroOperation
| KeiroProjectionTarget
| KeiroRebuildGroup
| KeiroProjectionOwner
| KeiroProjectionRevision
| KeiroExternalRead
>
