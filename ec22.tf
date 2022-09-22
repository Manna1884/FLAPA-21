resource "aws_instance" "server" {
  ami           = var.ami
  instance_type = var.instance_type
  iam_instance_profile = aws_iam_instance_profile.test_profile.id
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.sec_group.id]
  associate_public_ip_address = var.associate_public_ip_address
  subnet_id = aws_subnet.public_sub1.id
  
  tags = {
    name = var.instance_name
  }
}

resource "aws_instance" "server2" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.sec_group2.id]
  subnet_id = aws_subnet.private_sub2.id
  
  tags = {
    name = var.instance_name2
  }
}

resource "aws_instance" "server3" {
  ami           = var.ami
  instance_type = var.instance_type
  iam_instance_profile = aws_iam_instance_profile.test_profile.id
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.sec_group.id]
  associate_public_ip_address = var.associate_public_ip_address
  subnet_id = aws_subnet.public_sub2.id
  
  tags = {
    name = var.instance_name3
  }
}

