resource "aws_instance" "example" {
  ami           = local.ami_id   # While refering it should be local (While storing should be locals)
  instance_type = local.instance_type
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  tags = local.ec2_final_tags  # Better read-ability
}

# 1st this SG will be created and then it will be attached to the EC2 instance. 

resource "aws_security_group" "allow_tls" { # --> This var is for terrraform security group
  name        = "allow-all-terraform" # --> This is the name of the security group in AWS
  description = "Allow TLS inbound traffic and all outbound traffic"

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" # All traffic
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