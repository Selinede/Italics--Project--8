
# Italics Web EC2 -1
resource "aws_instance" "Italics-Webserver1" {

  ami             = "ami-0d3c032f5934e1b41" 
  instance_type   = "t2.micro"
  key_name        = "Italics-8"
  subnet_id       = aws_subnet.Italics-Pub-Subnet1.id

  availability_zone = "eu-west-3a"
  vpc_security_group_ids = [aws_security_group.Italics-vpc-security-group.id]


  user_data = <<EOF
  #!/bin/bash
# get admin privileges
sudo su
# install httpd (Linux 2 version)
yum update -y
yum install -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service
echo "Hello World from $(hostname -f)" > /var/www/html/index.html
  
  EOF

  tags = {


    Name = "Italics-Webserver1"
  } 
}

#Italics Web EC2 -2

resource "aws_instance" "Italics-Webserver2" {

  ami             = "ami-0c73cd1c5347436f3" 
  instance_type   = "t2.micro"
  key_name        = "Italics-08"
  subnet_id       = aws_subnet.Italics-Pub-Subnet2.id

  availability_zone = "eu-west-3b"
  vpc_security_group_ids = [aws_security_group.Italics-vpc-security-group.id]


  user_data = <<EOF
   #!/bin/bash
# get admin privileges
sudo su
# install httpd (Linux 2 version)
yum update -y
yum install -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service
echo "Hello World from $(hostname -f)" > /var/www/html/index.html
  
  EOF

  tags = {


    Name = "Italics-Webserver2"
  } 
} 
