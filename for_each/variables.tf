# Commented ? --> │ Variable names must be unique within a module.
# variable "instances" {
#     type =  map
#     default = {
#         mongodb = "t3.micro"
#         redis = "t3.micro"
#         mysql = "t3.small" # Heavy instance so extra resource 
#         rabbitmq = "t3.micro"
#         shiping = "t3.small"
#     }
# }
# This should be converted into set {} in ec2.tf used toset()
variable "instances" {
  default = ["mongodb", "redis"]
  type = list
}

variable "zone_id" {
  default = "Z02030392LMN8KQVWR9UZ"
}

variable "domain_name" {
  default = "dawsmani.site"
}