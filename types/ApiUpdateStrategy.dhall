-- ApiUpdateStrategy.dhall
-- Strategy for propagating API updates to consumers

< ClientFirst     -- Update client libraries before consumers
| ManualApproval  -- Require manual approval for each consumer
| NoAutomation    -- Do not automate updates
>
