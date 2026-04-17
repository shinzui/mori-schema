-- package.dhall
-- Re-exports for convenient imports
--
-- Usage in a mori/tech-radar.dhall:
--   let TechRadar = https://raw.githubusercontent.com/.../extensions/tech-radar/package.dhall
--   in TechRadar.TechRadar::{
--        recommendations =
--          [ TechRadar.Recommendation::{ … }
--          ]
--        }

let Recommendation = ./Recommendation.dhall

let TechRadar = ./TechRadar.dhall

let AdoptionLevel = ./AdoptionLevel.dhall

let Category = ./Category.dhall

in  { Recommendation, TechRadar, AdoptionLevel, Category }
