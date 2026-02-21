resource "aws_route53_record" "www" {
  count = 10
  zone_id = var.zone_id
  # Interpolation (Combining 2 different variables to create a new value) 
  name    = "${var.instances[count.index]}.${var.domain_name}"  #mongodb.dawsmani.site
  type    = "A"
  ttl = 1
  records = [aws_instance.example[count.index].private_ip] # mongodb privateIP
}

# Dependency : 1st need to create EC2 instance and then we can create the record in Route53.