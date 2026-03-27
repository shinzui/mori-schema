-- ContentType.dhall
-- What form the cookbook content takes

< SampleCode       -- Runnable or copy-pasteable code examples
| Instructions     -- Step-by-step procedures to follow
| Pattern          -- Reusable design or code patterns to adapt
| Configuration    -- Config file templates or environment setup
| Template         -- Project or file scaffolding templates
| Other : Text
>
