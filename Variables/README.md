# Variables In Terraform 

Variables offers a way to dynamically set values based on the context without having to change the 
module which is usefull when sharing modules across multiple projects

#### Terrafrom Types 

+ string
+ number
+ bool

+ list(<TYPE>)
+ set(<TYPE>)
+ map(<TYPE>)
+ object({<ATTRIBUTE NAME> = <TYPE>, ... })
+ tuple([<TYPE>, ...])



## Ways To Specify Variables in Terrafrom

###  Default Variables
```terraform
variable "" {
    default = "Default Value"
    type = <TYPE>
}
```

###  Local Variables
```terrafrom
locals {
    name = "value"
}


```
#### To use it
```terraform
resource "aws_instance" "demo" {
    name = local.name
}

resource "aws_security_group" "demo-SG" {
    name = "${local.name}-security-group"
}
```

### + Tfvars
  Is a way to set dynamic variables files depending on the context
  For Example: 
  `prod.tfvars` and `dev.tfvars`
  `terraform.tfvars` is automatically loaded
  `*.auto.tfvars` is automatically loaded in lexical order

+ Tfvars.json 
  similar to .tfvars in json format

###  -var and -var-file flags
  is used to specify particular file to load, ovrides any exisisting variables (Highest Precedence)

```bash
terraform apply -var prod.tfvars
```
