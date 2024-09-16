resource "local_file" "vpc-output" {
    content  = aws_instance.Public_EC2["hamada public"].associate_public_ip_address
    filename = "public-output.txt"
}