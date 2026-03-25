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

# 1. terraform import is the option
# 2. create skelton syntax for all the resources and provider file
# 3. run import command to get the details from terraform state : terraform import aws_instance.import <Instance_ID>
# 4. terraform plan (we get full details, we can pick and place them into resource definition)


