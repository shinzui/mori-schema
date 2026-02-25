-- ConfigValueType.dhall
-- Type of configuration value

< String
| Integer
| Boolean
| Secret      -- Sensitive value, handle with care
| Url
| FilePath
| Duration
| Json
| Other : Text
>
