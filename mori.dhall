let Schema =
      https://raw.githubusercontent.com/shinzui/mori-schema/027403783777cbce0e87eb660a0b3d8119ebe8d2/package.dhall
        sha256:d29ca03286afa92b7589d09b7a6d98ad8e39d11b255a4b8751f3327b0722fba3

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
    , okfBundles =
      [ Schema.OkfBundle::{
        , name = "capabilities"
        , path = "docs/capabilities"
        , profile = Some "docs/capabilities/profile.dhall"
        , okfVersion = "0.2"
        , description = Some
            "What mori-schema provides today, one concept per capability, with evidence"
        }
      ]
    }
