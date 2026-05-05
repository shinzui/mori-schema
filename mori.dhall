let Schema =
      https://raw.githubusercontent.com/shinzui/mori-schema/02a8a876f6f7074510eb03071116d57f5529378b/package.dhall
        sha256:a19f5dd9181db28ba7a6a1b77b5ab8715e81aba3e2a8f296f40973003a0b4412

in  Schema.Project::{
    , project = Schema.ProjectIdentity::{
      , name = "mori-schema"
      , namespace = "shinzui"
      , type = Schema.PackageType.Library
      , language = Schema.Language.Dhall
      , lifecycle = Schema.Lifecycle.Active
      , description = Some
          "Dhall schema package for mori project identity, automation, and extensions"
      }
    , repos = [ Schema.Repo::{
        , name = "mori-schema"
        , github = Some "shinzui/mori-schema"
        }
      ]
    , packages =
      [ Schema.Package::{
        , name = "mori-schema"
        , type = Schema.PackageType.Library
        , language = Schema.Language.Dhall
        , path = Some "."
        , description = Some
            "Record types with defaults for authoring mori.dhall configurations"
        }
      , Schema.Package::{
        , name = "mori-schema-cookbook"
        , type = Schema.PackageType.Library
        , language = Schema.Language.Dhall
        , path = Some "extensions/cookbook"
        , description = Some
            "Cookbook extension schema (CookbookCatalog, CookbookEntry, ContentType, Topic)"
        }
      , Schema.Package::{
        , name = "mori-schema-tech-radar"
        , type = Schema.PackageType.Library
        , language = Schema.Language.Dhall
        , path = Some "extensions/tech-radar"
        , description = Some
            "Tech radar extension schema (TechRadar, Recommendation, AdoptionLevel, Category)"
        }
      , Schema.Package::{
        , name = "mori-schema-checklist"
        , type = Schema.PackageType.Library
        , language = Schema.Language.Dhall
        , path = Some "extensions/checklist"
        , description = Some
            "Checklist extension schema (ChecklistCatalog, Checklist, ChecklistItem, StepKind, Category)"
        }
      , Schema.Package::{
        , name = "mori-schema-upstream-issues"
        , type = Schema.PackageType.Library
        , language = Schema.Language.Dhall
        , path = Some "extensions/upstream-issues"
        , description = Some
            "Upstream-issues extension schema (UpstreamIssuesCatalog, UpstreamIssue, IssueStatus)"
        }
      ]
    }
