resource "local_file" "inventory" {
  content = <<EOF
[app]
${join("\n", [for instance in aws_instance.Public_EC2 : instance.public_ip if instance.public_ip != null])}
EOF
  filename = "inventory.txt"
}

