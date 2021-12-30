

# PROJECT ITALICS RDS 
# aws_db_instance

resource "aws_db_instance" "RDS-Italics" {
  allocated_storage    = 12
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "Italicsdb"
  username             = "proItalics"
  password             = "ItalicsRoyal80"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.Italics-db-group.name

  multi_az = "true"
}


# db_subnet group

resource "aws_db_subnet_group" "Italics-db-group" {
  name       = "italics-db1"
  subnet_ids = [aws_subnet.Italics-Pri-Subnet-Database1.id, aws_subnet.Italics-Pri-Subnet-Database2.id  ]

  tags = {
    Name = "My-DB-Pri-sub-group"
  }
}

# SECURITY GROUP FOR DATABASE instance

resource "aws_security_group" "Italics-db-secgrp" {
  name              = "Italics-db_sec-group"
  description       = "Allow mysql inbound traffic"
  vpc_id            = aws_vpc.Italics_vpc.id

}

resource "aws_security_group_rule" "Italics-inbound" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.Italics-db-secgrp.id
}

resource "aws_security_group_rule" "Italics-outbound" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.Italics-db-secgrp.id
}