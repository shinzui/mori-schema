-- ConsumerBatching.dhall
-- How to batch updates to API consumers

< Sequential  -- Update consumers one at a time
| Parallel    -- Update all consumers simultaneously
>
