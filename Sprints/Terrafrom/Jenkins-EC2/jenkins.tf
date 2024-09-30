resource "aws_instance" "Jenkins-EC2" {
  ami                         = "ami-005fc0f236362e99f"
  key_name                    = "sprintproject"
  instance_type               = "t3.small"
  associate_public_ip_address = true
  subnet_id                   = "subnet-09f42d89ab1d6b5e2"
  vpc_security_group_ids      = ["sg-06221d25e60a0ebdb"]
  
  tags = {
    Name = "Jenkins"
  }
}
