/*
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["686591753714"]
}
*/
resource "aws_instance" "gitlab_instance" {
  ami           = "ami-045a8ab02aadf4f88"
  #data.aws_ami.ubuntu.id
  instance_type = "t2.micro"    
  key_name      = var.key_name   

  tags = {
    Name = "GitLab-Server"
  }
}


resource "aws_security_group" "service_security_group" {
  name        = "ec2_security_group_gitlab"
  description = "Allow HTTP traffic"
  vpc_id      = data.aws_vpc.selected.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ec2_security_group_gitlab"
  }

}

output "gitlab_public_ip" {
  value = aws_instance.gitlab_instance.public_ip
}