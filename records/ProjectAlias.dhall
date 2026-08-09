-- ProjectAlias.dhall
-- A former registry identity of the declaring project.
--
-- Resolution treats an alias as pointing at the project that declares it.
-- Both fields are identity-bearing and therefore required.

let ProjectAliasType = { namespace : Text, name : Text }

let ProjectAliasInput = ProjectAliasType

let projectAliasDefault = {=}

let mkProjectAlias =
      \(input : ProjectAliasInput) ->
        ((projectAliasDefault // input) : ProjectAliasType)

in  { Type = ProjectAliasType
    , Input = ProjectAliasInput
    , default = projectAliasDefault
    , mk = mkProjectAlias
    }
