-- package.dhall
-- Re-exports for convenient imports
--
-- Usage in a mori.dhall:
--   let Mori = https://raw.githubusercontent.com/.../schema/package.dhall
--   in Mori.Project::{ ... }

-- Types
let Language = ./types/Language.dhall
let PackageType = ./types/PackageType.dhall
let Lifecycle = ./types/Lifecycle.dhall
let Visibility = ./types/Visibility.dhall
let DependencyKind = ./types/DependencyKind.dhall
let DependencySource = ./types/DependencySource.dhall
let DocKind = ./types/DocKind.dhall
let DocLocation = ./types/DocLocation.dhall
let DocAudience = ./types/DocAudience.dhall
let ApiType = ./types/ApiType.dhall
let ApiDependencyRole = ./types/ApiDependencyRole.dhall
let ApiUpdateStrategy = ./types/ApiUpdateStrategy.dhall
let ConsumerBatching = ./types/ConsumerBatching.dhall
let ConfigValueType = ./types/ConfigValueType.dhall
let ConfigSourceHint = ./types/ConfigSourceHint.dhall
let StandardScope = ./types/StandardScope.dhall
let Origin = ./types/Origin.dhall
let PermissionMode = ./types/PermissionMode.dhall
let RuntimeEnvironment = ./types/RuntimeEnvironment.dhall

-- Records
let DocRef = ./records/DocRef.dhall
let Repo = ./records/Repo.dhall
let Dependency = ./records/Dependency.dhall
let Package = ./records/Package.dhall
let PackageBundle = ./records/PackageBundle.dhall
let Runtime = ./records/Runtime.dhall
let ConfigItem = ./records/ConfigItem.dhall
let AgentHint = ./records/AgentHint.dhall
let Api = ./records/Api.dhall
let ApiDependency = ./records/ApiDependency.dhall
let ApiSource = ./records/ApiSource.dhall
let ApiUpdatePolicy = ./records/ApiUpdatePolicy.dhall
let StandardProject = ./records/StandardProject.dhall
let SkillTool = ./records/SkillTool.dhall
let Skill = ./records/Skill.dhall
let Subagent = ./records/Subagent.dhall

-- Root types
let Project = ./Project.dhall
let UserConfig = ./UserConfig.dhall

-- Automation types
let EventSelector = ./automation/EventSelector.dhall
let Automation = ./automation/Automation.dhall
let Reaction = ./automation/Reaction.dhall
let ReactionAction = ./automation/ReactionAction.dhall
let ExecutionPolicy = ./automation/ExecutionPolicy.dhall

in  { -- Types
      Language
    , PackageType
    , Lifecycle
    , Visibility
    , DependencyKind
    , DependencySource
    , DocKind
    , DocLocation
    , DocAudience
    , ApiType
    , ApiDependencyRole
    , ApiUpdateStrategy
    , ConsumerBatching
    , ConfigValueType
    , ConfigSourceHint
    , StandardScope
    , Origin
    , PermissionMode
    , RuntimeEnvironment

    -- Records
    , DocRef
    , Repo
    , Dependency
    , Package
    , PackageBundle
    , Runtime
    , ConfigItem
    , AgentHint
    , Api
    , ApiDependency
    , ApiSource
    , ApiUpdatePolicy
    , StandardProject
    , SkillTool
    , Skill
    , Subagent

    -- Root
    , Project
    , UserConfig

    -- Automation
    , EventSelector
    , Automation
    , Reaction
    , ReactionAction
    , ExecutionPolicy
    }
