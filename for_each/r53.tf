resource "aws_route53_record" "www" {
  for_each = aws_instance.example
  zone_id = var.zone_id
  # Interpolation (Combining 2 different variables to create a new value) 
  name    = "${each.key}.${var.domain_name}"  #mongodb.dawsmani.site
  type    = "A"
  ttl = 1
  records = [each.value.private_ip] # mongodb privateIP
}


# Dependency : 1st need to create EC2 instance and then we can create the record in Route53.