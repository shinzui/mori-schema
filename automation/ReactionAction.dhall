-- ReactionAction.dhall
-- Union type for automation reaction actions
--
-- ScheduledAction is a non-recursive subset: scheduled actions cannot
-- themselves contain a Schedule variant.

let ScheduledAction =
      < RunCommand :
          { command : Text
          , args : List Text
          , workingDir : Optional Text
          , timeout : Optional Integer
          , env : List { mapKey : Text, mapValue : Text }
          }
      | EmitEvent :
          { eventType : Text
          , streamName : Text
          , eventData : List { mapKey : Text, mapValue : Text }
          }
      | Notify :
          { url : Text
          , method : Optional Text
          , headers : List { mapKey : Text, mapValue : Text }
          , bodyTemplate : Optional Text
          }
      | Signal :
          { signalType : Text
          , targets : List Text
          , payload : List { mapKey : Text, mapValue : Text }
          }
      >

in  < RunCommand :
        { command : Text
        , args : List Text
        , workingDir : Optional Text
        , timeout : Optional Integer
        , env : List { mapKey : Text, mapValue : Text }
        }
    | EmitEvent :
        { eventType : Text
        , streamName : Text
        , eventData : List { mapKey : Text, mapValue : Text }
        }
    | Notify :
        { url : Text
        , method : Optional Text
        , headers : List { mapKey : Text, mapValue : Text }
        , bodyTemplate : Optional Text
        }
    | Schedule :
        { delaySeconds : Integer
        , action : ScheduledAction
        }
    | Signal :
        { signalType : Text
        , targets : List Text
        , payload : List { mapKey : Text, mapValue : Text }
        }
    >
