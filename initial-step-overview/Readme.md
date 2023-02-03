# Lab 1: Overview about initial Terraform step 

## Objective
This lab provide description about initial Terraform step

---
### Init library
`terraform init` is a command help you to pull lib from main.tf. In this case, lib is **aws provider**

After run `init` command, see folder `.terraform`, this folder includes code base of Provider

### Check resource terraform will initial
`terraform plan` is a command to show resource terraform will init when run code base from file **main.tf**

_Note: When code base will init too many resource, command `plan` become slower, we can run `-parallelism=n` to run with parallelism
For example `terraform plan -parallelism=2`_

If we need save result of `plan` command, run `-out`
```
$ terraform plan -out plan.out
$ terraform show -json plan.out > plan.json
```
### Initial Resource
`terraform apply` will connect to AWS to init resource.  
**Important**: `terraform.tfstate` is a file save current resource, whatever was created by terraform. This file will use by terraform compare when run
`destroy` resource command

Note: If we terminate apply process, resource still initializing in AWS and terraform will miss information from init proccess
==> when we run `destroy`, terraform will return error and we will check error by hand

### Destroy Resource
`terraform destroy`

Of course, we need recheck file `terraform.tfstate` to make sure resource is completely clean.

---
## Data block
This block to call API for get detail about some resource. Block won't create any resource in AWS cloud.

## Running
```
$ terraform init                    # pull code from provider
$ terraform apply -auto-approve     # initial EC2
$ terraform destroy -auto-approve   # destroy EC2
```