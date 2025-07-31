## file structure

```
/infra/
  └─ /terraform/
       ├─ .terraform.lock.hcl        # terraform provider/module versioning
       ├─ main.tf                    # core providers and backend config
       ├─ plan                       # terraform plan
       ├─ resource_media_stack.tf    # media_stack resource definitions
       ├─ resource_plex.tf           # plex resource definitions
       ├─ resource_stash.tf          # stash resource definitions
       ├─ terraform.tfvars           # secret token info
       └─ vars.tf                    # all variables
```