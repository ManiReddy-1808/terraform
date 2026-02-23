variable "common_tags" {
    default = {
        Project = "roboshop"
        Terraform = "true"
        Environment = "DEV"
    }  
}

variable "ec2_tags" {
    default = {
        Name = "functions-demo"
        Environment = "PROD"
    }
}

variable "sg_tags" {
    default = {
        Name = "functions-demo"
    }
}