# Configure Sec Group
resource "aws_security_group" "sec_group" {
  vpc_id      = aws_vpc.Main.id

  ingress {
    from_port        = var.ingress_allow_http_80
    to_port          = var.ingress_allow_http_80
    protocol         = var.protocol_tcp
    cidr_blocks      = var.cidr_blocks_ingress

  }

ingress {
    from_port        = var.ingress_allow_ssh_22
    to_port          = var.ingress_allow_ssh_22
    protocol         = var.protocol_tcp
    cidr_blocks      = var.cidr_blocks_ingress

  }
  egress {
    from_port        = var.port_egress
    to_port          = var.port_egress
    protocol         = var.protocol_1
    cidr_blocks      = var.cidr_blocks_egress
    
  }

  tags = {
    Name = var.sec_group_name
  }
}