-- Proves all three runtime-neutral DDD coordination contracts.
let Ddd = ../package.dhall

let MoriRef = ../../../records/MoriRef.dhall

let MoriArtifactKind = ../../../types/MoriArtifactKind.dhall

let paymentAuthorized =
      Ddd.CoordinationMessage::{
      , message = "PaymentAuthorized"
      , kind = Ddd.MessageKind.Event
      }

let reserveInventory =
      Ddd.CoordinationMessage::{
      , message = "ReserveInventory"
      , kind = Ddd.MessageKind.Command
      }

let releaseInventory =
      Ddd.CoordinationMessage::{
      , message = "ReleaseInventory"
      , kind = Ddd.MessageKind.Command
      }

in  Ddd.DddModel::{
    , contexts =
      [ Ddd.BoundedContext::{ key = "orders", name = "Orders" }
      , Ddd.BoundedContext::{ key = "payments", name = "Payments" }
      ]
    , flows =
      [ Ddd.MessageFlow::{
        , key = "order-fulfillment"
        , name = "Order fulfillment"
        , steps =
          [ Ddd.FlowStep::{
            , order = 1
            , message = "PaymentAuthorized"
            , kind = Ddd.MessageKind.Event
            , from = "payments"
            , to = "orders"
            }
          ]
        }
      ]
    , reactors =
      [ Ddd.Reactor::{
        , key = "reserve-paid-order"
        , name = "Reserve inventory for paid order"
        , context = "orders"
        , trigger = paymentAuthorized
        , actions = [ "Issue ReserveInventory" ]
        , idempotencyStrategy = "Deduplicate by payment event id"
        , consumes = [ paymentAuthorized ]
        , emits = [ reserveInventory ]
        , participants = [ "payments" ]
        , participantRefs =
          [ MoriRef::{
            , namespace = "acme"
            , name = "commerce"
            , kind = Some MoriArtifactKind.DddContext
            , key = Some "payments"
            }
          ]
        , flows = [ "order-fulfillment" ]
        , flowRefs =
          [ MoriRef::{
            , namespace = "acme"
            , name = "commerce"
            , kind = Some MoriArtifactKind.DddFlow
            , key = Some "order-fulfillment"
            }
          ]
        }
      ]
    , processManagers =
      [ Ddd.ProcessManager::{
        , key = "order-fulfillment"
        , name = "Order fulfillment"
        , context = "orders"
        , durableState = [ "paymentStatus", "inventoryStatus" ]
        , correlationKeys = [ "orderId" ]
        , correlationRule = "Correlate every message by orderId"
        , transactionBoundary =
            "One event and resulting commands per transaction"
        , idempotencyStrategy = "Deduplicate by message id within an order"
        , retryPolicy = "Retry transient command delivery with bounded backoff"
        , deadLetterPolicy = "Park exhausted deliveries for operator review"
        , repairProcedure = "Replay the order stream after correcting bad data"
        , replayEvidence = "Rebuilds state from the order coordination journal"
        , consumes = [ paymentAuthorized ]
        , emits = [ reserveInventory, releaseInventory ]
        , timers =
          [ Ddd.CoordinationTimer::{
            , key = "inventory-deadline"
            , name = "Inventory deadline"
            , deadline = "PT15M after payment authorization"
            , emits = releaseInventory
            }
          ]
        }
      ]
    , durableWorkflows =
      [ Ddd.DurableWorkflow::{
        , key = "recoverable-order-fulfillment"
        , name = "Recoverable order fulfillment"
        , context = "orders"
        , definitionId = "order-fulfillment"
        , definitionVersion = "2"
        , journal = Ddd.WorkflowJournal::{
          , name = "order-workflow-journal"
          , persistence = "PostgreSQL append-only events"
          , retention = Some "Retain for the order lifetime plus seven years"
          }
        , steps =
          [ Ddd.DurableWorkflowStep::{
            , key = "reserve-inventory"
            , name = "Reserve inventory"
            , idempotencyStrategy = "Use workflow id and step key"
            }
          ]
        , terminalPolicy = "The first durable terminal event wins"
        , versioningPolicy =
            "Existing instances remain on their starting definition"
        , replayEvidence = "Definition v2 replays frozen journal fixtures"
        , recoveryProcedure = "Resume from the last committed durable step"
        , consumes = [ paymentAuthorized ]
        , emits = [ reserveInventory ]
        , externalWaits =
          [ Ddd.WorkflowExternalWait::{
            , key = "inventory-result"
            , name = "Inventory result"
            , callbackIdentity = "workflowId + wait key"
            , wakeSource = "InventoryReserved or InventoryRejected"
            }
          ]
        , timers =
          [ Ddd.CoordinationTimer::{
            , key = "inventory-deadline"
            , name = "Inventory deadline"
            , deadline = "PT15M after reserve-inventory"
            , emits = releaseInventory
            }
          ]
        , wakeSources = [ "inventory callback", "inventory deadline" ]
        , progressMechanisms = [ "journaled step completion" ]
        }
      ]
    }
