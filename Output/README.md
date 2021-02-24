# Terraform Output 

Can display specified value after running terrafrom apply



```terraform
resource "aws_instance" "demo" {
    ami = <ami>
}

output "instance_ip" {
    value = aws_instance.demo.public_ip
}

output "test" {
    value = "Test-Output"
}
```

```sh
terraform apply / terraform output

0.0.0.0
Test-Output
```
