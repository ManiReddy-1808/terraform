resource "aws_instance" "example" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  # self is the special variable
  provisioner "local-exec" {
    command = "echo ${self.public_ip} > inventory.ini"
  }
  provisioner "local-exec" {
    command = "echo script-2"    
  } 
  provisioner "local-exec" {
    command = "exit 1"
    on_failure = continue # Ignore the error and continue
  }
  provisioner "local-exec" {
    when = destroy
    command = "echo 'deleting the instance'"    
  }
  provisioner "local-exec" {
    when    = destroy
    command = "echo > inventory.ini"
  }

  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = self.public_ip
  }

  provisioner "remote-exec" { # Before running this provisioner, takes connection block to connect to the instance and then run the commands mentioned in the inline block. Inside the server.
    inline = [
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx"
    ]
  }

  provisioner "remote-exec" {
    inline = [
      "sudo systemctl stop nginx" # Better to stop the service before deleting the instance to avoid any issues.
    ]
    when = destroy
  }

  tags = {
    Name = "provisioners-demo"
    Project = "roboshop"
  }
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