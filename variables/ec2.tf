resource "aws_instance" "example" {
  ami           = var.ami_id # String
  instance_type = var.environment == "dev" ? "t3.micro" : "t3.small"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  tags = var.ec2_tags
}

# 1st this SG will be created and then it will be attached to the EC2 instance. 

resource "aws_security_group" "allow_tls" { # --> This var is for terrraform security group
  name        = var.sg_name # --> This is the name of the security group in AWS
  description = var.sg_description
  egress {
    from_port        = var.sg_from_port
    to_port          = var.sg_to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = var.sg_from_port
    to_port          = var.sg_to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = var.sg_tags
}