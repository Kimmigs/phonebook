output "my-website-url" {
    value ="http://${aws_lb.app-lb.dns_name}"
}

