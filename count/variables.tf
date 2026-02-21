variable "instances" {
  type = list 
  default = ["mongodb", "redis", "mysql", "rabbitmq", "catalogue", "user", "cart", "shipping", "payment", "frontend"]
}
# Mongodb index values --> 0,1,2,3,4,5,6,7,8,9

variable "zone_id" {
  default = "Z02030392LMN8KQVWR9UZ"
}

variable "domain_name" {
  default = "dawsmani.site"
}

variable "fruits" {
    type = list(string)  #List allows duplicate values and maintains order.
    default = ["apple", "banana", "orange", "apple"]  
}

variable "fruits_set" {
    type = set(string)  #Set does not allow duplicate values and does not maintain order.
    default = ["apple", "banana", "orange", "apple", "banana", "grapes", "watermelon"]  
}

# for_each_loop only works with map and set. It does not work with list because list allows duplicate values.
