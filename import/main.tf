resource "aws_instance" "import" {
  instance_type = "t3.micro"
  ami           = "ami-0220d79f3f480ecf5"
  vpc_security_group_ids = [
    "sg-07c8acf3fa6b923fa"
  ]
  subnet_id = "subnet-05ba31ef8fb5ba283"
  tags = {
    Name = "import-demo-change"
  }
}
