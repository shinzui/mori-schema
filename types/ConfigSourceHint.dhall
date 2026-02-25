-- ConfigSourceHint.dhall
-- Hints for where config values should come from

< EnvVar : Text      -- Environment variable name
| K8sSecret : Text   -- Kubernetes secret name
| K8sConfigMap : Text  -- Kubernetes ConfigMap name
| Vault : Text       -- HashiCorp Vault path
| File : Text        -- File path
| Default : Text     -- Default value
>
