resource "aws_instance" "example" {
  for_each = toset(var.instances) # Converts this list to SET
  ami           = "ami-0220d79f3f480ecf5"
#   instance_type = each.value # From for_each loop getting 1st instance
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  tags = {
    Name = each.key # From fro_each loop
    Project = "roboshop"
  }
}

resource "aws_security_group" "allow_tls" { # --> This var is for terrraform security group
  name        = "allow-all-terraform" # --> This is the name of the security group in AWS
  description = "Allow TLS inbound traffic and all outbound traffic"

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow-all-terraform"
  }
}