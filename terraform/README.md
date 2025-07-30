## file structure

```
/infra/
  └─ /terraform/
       ├─ main.tf                    # core providers and backend config
       ├─ resource_sonarr.tf         # sonarr resource definitions
       ├─ terraform.tfvars           # secret token info
       └─ vars.tf                    # all variables
```