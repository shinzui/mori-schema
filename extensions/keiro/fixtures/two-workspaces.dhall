-- Two keiro services declared by one repository: one workspace manifest
-- with an explicit source path, and one single-source service whose
-- source sits beside its topology document.
let Keiro = ../package.dhall

in  Keiro.KeiroModel::{
    , workspaces =
      [ Keiro.KeiroWorkspace::{
        , service = "hospital-capacity"
        , topology = "services/hospital/hospital-capacity.service-topology.json"
        , workspace = Some "services/hospital/spec/hospital-capacity.keiro"
        , description = Some "Hospital capacity and transfer reservations"
        }
      , Keiro.KeiroWorkspace::{
        , service = "incident-command"
        , topology = "services/incident/incident-command.service-topology.json"
        }
      ]
    }
