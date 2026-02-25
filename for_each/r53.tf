resource "aws_route53_record" "www" {
  for_each = aws_instance.example
  zone_id = var.zone_id
  # Interpolation (Combining 2 different variables to create a new value) 
  name    = "${each.key}.${var.domain_name}"  #mongodb.dawsmani.site
  type    = "A"
  ttl = 1
  # records = [each.value.private_ip] # mongodb privateIP
  records = [lookup(aws_instance.example, "frontend", null).private_ip] # frontend privateIP 
  # null used to avoid error when the key is not found in the map.
  allow_overwrite = true
}


# Dependency : 1st need to create EC2 instance and then we can create the record in Route53.