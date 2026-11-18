-- package.dhall
-- Re-exports for convenient imports.
--
-- Usage in a mori/keiro.dhall:
--   let Keiro = https://raw.githubusercontent.com/.../extensions/keiro/package.dhall
--   in Keiro.KeiroModel::{
--      , workspaces =
--        [ Keiro.KeiroWorkspace::{
--          , service = "mori"
--          , topology = "domain/mori.service-topology.json"
--          , workspace = Some "domain/mori.keiro-workspace"
--          }
--        ]
--      }
let KeiroModel = ./KeiroModel.dhall

let KeiroWorkspace = ./KeiroWorkspace.dhall

in  { KeiroModel, KeiroWorkspace }
