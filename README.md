# Jumpbox

This repository is a starting point for standing up the Tanzu Platform

The terraform scripts create a minimal VM that can use
[deploy-bucc](https://github.com/dashaun-cloud/deploy-bucc)
and
[BUCC](https://github.com/starkandwayne/bucc)
to create a control plane with
[Tanzu Platform Automation Toolkit](https://docs.pivotal.io/platform-automation/v4.3/index.html)



## Getting Started

Install [Terraform](https://www.terraform.io/downloads.html) version >= 0.12
```
$ terraform -version
Terraform v0.12.23
+ provider.azurerm v2.5.0
```

Clone this repository to make a jumpbox.

```
$ git clone https://github.com/codeinthecloud-io/jumpbox
```

### Azure

There are default values for all variables except these four:

- subscription_id
- tenant_id
- client_id
- client_secret

```
$ cd jumpbox/azure
$ cp terraform.tfvars.example terraform.tfvars
```

Populate **terraform.tfvars** with *your* values using your favorite editor.

```
$ terraform plan
...
...
...

Plan: 6 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.

$
```

Apply the terraform:

```
$ terraform apply
Plan: 6 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

azurerm_resource_group.jumpbox: Creating...
...
...
...
Apply complete! Resources: 6 added, 0 changed, 0 destroyed.

Outputs:

jumpbox = {"cloud_name":"public","location":"centralus","path_to_ssh_public_key":"~/.ssh/id_rsa.pub","public_ip":"123.12.213.19","resource_group_name":"jumpbox-resource-group","vm_priority":"Spot","vm_size":"Standard_D4s_v3","vm_username":"admin"}

$
```

Your jumpbox is ready for some action!  If that is all you want, you can stop here.

If you plan on using [deploy-bucc]() keep going.

Running the script on your new jumpbox, via ssh, installs the prerequisites for [deploy-bucc]().

```
$ ssh admin@123.12.213.19 < ../sh/pre-deploy-bucc.sh
...
...
$
```

Move on to the next step with [deploy-bucc](https://github.com/codeinthecloud-io/deploy-bucc)!

## GCP

Coming soon.

## AWS

Coming soon.