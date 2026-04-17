-- TechRadar.dhall
-- Root type for the tech-radar extension (list of recommendations).
--
-- Exports the { Input, Type, default, mk } record bundle so consumers can
-- write `TechRadar.TechRadar::{ recommendations = [ … ] }` or even
-- `TechRadar.TechRadar::{=}` for an empty radar.

let Recommendation = ./Recommendation.dhall

let TechRadarType = { recommendations : List Recommendation.Type }

let TechRadarInput = {}

let techRadarDefault = { recommendations = [] : List Recommendation.Type }

let mkTechRadar =
      \(input : TechRadarInput) -> ((techRadarDefault // input) : TechRadarType)

in  { Type = TechRadarType
    , Input = TechRadarInput
    , default = techRadarDefault
    , mk = mkTechRadar
    }
