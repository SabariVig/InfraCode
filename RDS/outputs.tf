output "db_host" {
    value =aws_db_instance.mysql.address
}

output "db_username" {
    value = aws_db_instance.mysql.username
}

output "db_pass" {
    value = random_string.password.result
}

output "db_name" {
    value = aws_db_instance.mysql.name
}
