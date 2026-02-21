resource "aws_instance" "example" {
  count = 10
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
#   vpc_security_group_ids = [aws_security_group.allow_tls.id]

  tags = {
    Name = var.instances[count.index] # --> Fetch the name of the instance as per the list defined in variables.tf
    Project = "roboshop"
  }
}

# 1st this SG will be created and then it will be attached to the EC2 instance. 

resource "aws_security_group" "allow_tls" { # --> This var is for terrraform security group
  name        = "allow-all-roboshop" # --> This is for security group in AWS
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