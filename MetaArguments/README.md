# MetaArguments 

Provides A way to special arguments which change the functionality of the resource

+ depends_on
+ count
+ for_each
+ provider
+ lifecycle

#### depends_on 
allows an argument to specify any particular resource if terrafrom cannot automatically infer



#### count
an argument to specifiy the number on resource terraform needs to create with same configuration


```terraform
resource "aws_instance" "count_demo" {
  ami = var.ami
  instance_type = var.instance_type
  count = 2
}

output  "instance_ips" {
  value = aws_instance.count_demo[*].public_ip
}

output  "instance_ip" {
  value = aws_instance.count_demo[0].public_ip
}
```

#### for_each
The for_each meta-argument accepts a map or a set of strings, and creates an instance for each item in that map or set.



#### provider 
allows to specify a different provider to indivudial resource

#### lifecycle
lifecycle is a nested block that can appear within a resource block. The lifecycle block and its contents are meta-arguments, available for all resource blocks regardless of type.

+ create_before_destroy (bool) - By default, when Terraform must change a resource argument that cannot be updated in-place due to remote API limitations, 
Terraform will instead destroy the existing object and then create a new replacement object with the new configured arguments.

+ prevent_destroy (bool) - This meta-argument, when set to true, will cause Terraform to reject with an error any plan that would destroy the infrastructure object associated with the resource, 
as long as the argument remains present in the configuration.

+ ignore_changes (list of attribute names) -The ignore_changes feature is intended to be used when a resource is created with references to data that may change in the future, 
but should not affect said resource after its creation.


