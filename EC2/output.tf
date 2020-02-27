output "Elastic_IP" {
  value =aws_eip.MyElasticIP.*.public_ip

}

output "EC2_Public_IP" {
  value = aws_instance.MYEC2.*.public_ip
}

