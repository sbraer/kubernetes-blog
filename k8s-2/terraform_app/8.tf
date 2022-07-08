resource "aws_route53_record" "www-apache" {
  zone_id = data.aws_route53_zone.myzone.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = data.aws_lb.ingress-load-balancer.dns_name
    zone_id                = data.aws_lb.ingress-load-balancer.zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www-nginx" {
  zone_id = data.aws_route53_zone.myzone.zone_id
  name    = "nginx.${var.domain_name}"
  type    = "A"

  alias {
    name                   = data.aws_lb.ingress-load-balancer.dns_name
    zone_id                = data.aws_lb.ingress-load-balancer.zone_id
    evaluate_target_health = false
  }
}
