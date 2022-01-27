# Terraform Setup

* Install [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)
* Modify the contents of the provider.tf file to the following:
```
provider aws {
  access_key = "key-in-the-shared-drive"
secret_key = "key-in-the-shared-drive"
  region  = "eu-west-1"
}
```
* Run the following from the current directory:
```
terraform init
terraform plan
terraform apply
```

* This will create all the infrastructure for both the container app and the serverless app

* Each project can be independently managed using the respective modules.
 -  `module.serverless_app`
 - `module.container_app`
