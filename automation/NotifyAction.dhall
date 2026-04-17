-- NotifyAction.dhall
-- Payload for Schema.ReactionAction.Notify.
--
-- Exports { Input, Type, default, mk } so consumers can write
-- `Schema.ReactionAction.Notify Schema.NotifyAction::{ url = "..." }`
-- and omit method/headers/bodyTemplate.

let NotifyActionType =
      { url : Text
        -- Webhook or notification endpoint URL

      , method : Optional Text
        -- HTTP method (None = POST)

      , headers : List { mapKey : Text, mapValue : Text }
        -- Additional HTTP headers

      , bodyTemplate : Optional Text
        -- Optional body template (None = default JSON payload)
      }

let NotifyActionInput = { url : Text }

let notifyActionDefault =
      { method = None Text
      , headers = [] : List { mapKey : Text, mapValue : Text }
      , bodyTemplate = None Text
      }

let mkNotifyAction =
      \(input : NotifyActionInput) ->
        ((notifyActionDefault // input) : NotifyActionType)

in  { Type = NotifyActionType
    , Input = NotifyActionInput
    , default = notifyActionDefault
    , mk = mkNotifyAction
    }
