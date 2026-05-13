# output "instance_web_id" {
#   value = {
#   id = aws_instance.this.id
#   public_ip = aws_instance.this.public_ip
#   }
# }

output "instance" {
  value = {
    (local.instance.name) = {
      id = aws_instance.this.id
      public_ip = aws_instance.this.public_ip
    }
  }
}

output "instance_web_public_ip" {
  value = {
    id = aws_instance.this.id
    public_ip = aws_instance.this.public_ip
  }
}

output "sg_instance_web_id" {
  value = {
    id = aws_security_group.this.id
    name = aws_security_group.this.name
  }
}

output "sg_instance_web_name" {
  value = aws_security_group.this.name
}

output "sg_instance_web_iam_role" {
  value = {
    name = aws_iam_role.this.name
  }
}